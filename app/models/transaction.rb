class Transaction < ApplicationRecord
    belongs_to :leaver, class_name: "User"
    belongs_to :receiver, class_name: "User"
    has_many :sent_user, class_name: "Request",
                        foreign_key: "transaction_id",
                        dependent: :destroy
end
