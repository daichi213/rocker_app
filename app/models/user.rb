class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code

  acts_as_mappable
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  # include Geocoder::Model::Mongoid
  # include Geocoder::Model::MongoMapper

  # TODO TRANSACTION_TABLEへの紐付け追加
  has_one :receivable_baggages, class_name: "Baggage",
                                foreign_key: "user_id"
  has_many :active_requires, class_name: "BaggageRequest",
                             foreign_key: "user_id"
  has_many :active_request, class_name: "BaggageRequestToUser",
                            foreign_key: "requires_id"
  has_many :passive_request, class_name: "BaggageRequestToUser",
                             foreign_key: "required_id"
  has_many :active_required, through: :passive_request, source: :baggage_request_to
  has_many :requires, through: :active_request, source: :required
  has_many :required, through: :passive_request, source: :requires
  has_many :messages_in_requires, through: :active_request, source: :messages
  has_many :messages_in_required, through: :passive_request, source: :messages
  has_many :inquiries
  has_many :positions

  def get_activation_request_from
    self.passive_request.
      where(
        'del_flag LIKE ?', 0
      )
  end

  def get_passive_request_id(baggage_request_id)
    get_activation_request_from.find_by(baggage_request_id: baggage_request_id)
  end

  # includes内のキー名称は左側に従属するクラスのキーを持ってくる
  def required_baggage
    BaggageRequest.get_required_baggage_request(self.id)
  end

  def approval_requests
    self.required_baggage.where(approval_flag: 1,
                                leaver_start_authenticate: 0,
                                receiver_start_authenticate: 0)
  end

  def intend_to_requests
    BaggageRequest.get_intend_to_request(self.id)
  end

  def contracted_transaction
    BaggageRequest.get_request_in_transaction(self.id)
  end

  # TODO includesを使用する、全ユーザーのmessagesを取得してしまっている
  def dont_read_message
    Message.where(
      "user_id LIKE ?", self.id,
    )
  end

  def dont_read_inquiry
    Inquiry.where(
      "user_id LIKE ? AND solved_flag LIKE ?", self.id, 1
    )
  end

  def receiving_in_transaction
    BaggageRequest.get_receiving_in_transaction(self.id)
  end

  def leaving_in_transaction
    BaggageRequest.get_leaving_in_transaction(self.id)
  end

  # TODO 要チェック
  def contracted_in_transaction
    self.includes(
      :active_requires
    ).where(
      "leaver_start_authenticate LIKE ? AND
       receiver_start_authenticate LIKE ? AND
       leaver_end_authenticate LIKE ? AND
       receiver_end_authenticate LIKE ?",
       1, 1, 1, 1
    ).references(
      :active_requries
    )
  end

  accepts_nested_attributes_for :receivable_baggages

  attr_accessor :remember_token

  before_save {self.email = email.downcase} # または、{email.downcase!}

  # validation
  validates(:name, presence: true, length: {maximum: 50})
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    # {case_sensitive: false}をまるごとtrueに置き換えることで大文字と小文字を区別しなくなる
                    uniqueness: {case_sensitive: false})

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  mount_uploader :picture, ImageUploader

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def prefecture_name
    # tryメソッドは対象関数のインスタンスが存在している場合は:nameを実行する
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  # def prefecture_code(prefecture_name)
  #     self.prefecture_code = JpPrefecture::Prefecture.find(name: state).code
  # end

  def address
    # 最初はgeocoderのreadmeに従い、join(', ')としていたが、geocoded_by :addressでエラーが発生したため以下に修正
    [state, city, street, house].compact.join('')
  end

  geocoded_by :address
  after_validation :geocode, if: (:state_changed? ||
                                  :city_changed? ||
                                  :street_changed? ||
                                  :house_changed?)
end
