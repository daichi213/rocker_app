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
    has_many :active_requires, class_name: "BaggageRequestToUser",
                                foreign_key: "requires_id"
    has_many :requires, through: :active_requires, source: :requires
    has_many :required, through: :active_requires, source: :required
    has_many :request_content, through: :active_requires, source: :baggage_request

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

    # followユーザー一覧を取得
    def feed
        following_ids = "SELECT followed_id FROM relationships
                    WHERE follower_id = :user_id"
        Micropost.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
    end

    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        active_relationships.find_by(followed_id: other_user.id).destroy
    end

    def following?(other_user)
        following.include?(other_user)
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

    # geocoded_by :address
    # after_validation :geocode, if: (:state_changed? ||
    #                                 :city_changed? ||
    #                                 :street_changed? ||
    #                                 :house_changed?)
end
