class User < ApplicationRecord
    include JpPrefecture
    jp_prefecture :prefecture_code

    # include Geocoder::Model::Mongoid
    # include Geocoder::Model::MongoMapper

    # has_many :active_relationships, class_name: "Relationship",
    #                                 foreign_key: "follower_id",
    #                                 dependent: :destroy
    # has_many :passive_relationships, class_name: "Relationship",
    #                                 foreign_key: "followed_id",
    #                                 dependent: :destroy
    # has_many :following, through: :active_relationships, source: :followed
    # has_many :followers, through: :passive_relationships, source: :follower
    has_one :receivable_baggages, class_name: "Baggage",
                                foreign_key: "user_id"
    has_many :active_requires, class_name: "BaggageRequest",
                                foreign_key: "user_id"
    has_many :active_request, class_name: "BaggageRequestToUser",
                                foreign_key: "requires_id"
    has_many :passive_request, class_name: "BaggageRequestToUser",
                                foreign_key: "required_id"
    has_many :requires, through: :active_request, source: :required
    has_many :required, through: :passive_request, source: :requires
    has_many :messages_in_requires, through: :active_request, source: :messages
    has_many :messages_in_required, through: :passive_request, source: :messages

    # def requires
    #     if !self.active_requires.blank?
    #         self.active_requires.last.to_users.map{|i| i.required_id}
    #     else
    #         0
    #     end
    # end

    def get_activation_request_to
        self.active_request.
        where(
            'del_flag LIKE ?', 0
        )
    end

    def get_activation_request_from
        self.passive_request.
        where(
            'del_flag LIKE ?', 0
        )
    end

    def get_active_request_id(baggage_request_id)
        self.get_activation_request_to.find_by(baggage_request_id: baggage_request_id)
    end

    def get_passive_request_id(baggage_request_id)
        get_activation_request_from.find_by(baggage_request_id: baggage_request_id)
    end

    # includes内のキー名称は左側に従属するクラスのキーを持ってくる
    def required_baggage
        BaggageRequest.get_required_baggage_request(self.id)
    end

    def approval_requests
        self.required_baggage.where(approval_flag: 1)
    end

    def intend_to_requests
        BaggageRequest.get_intend_to_request(self.id)
    end

    accepts_nested_attributes_for :receivable_baggages

    attr_accessor :remember_token

    before_save {self.email = email.downcase}   # または、{email.downcase!}

    # validation
    validates(:name, presence: true , length: {maximum:50})
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(:email, presence: true , length: {maximum:255}, 
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
