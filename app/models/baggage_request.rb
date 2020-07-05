class BaggageRequest < ApplicationRecord
    belongs_to :leaver, class_name: "User"
    belongs_to :transactions, class_name: "Transaction"
    has_many :baggage_request_to, class_name: "BaggageRequestToUser",
                        foreign_key: "baggage_request_id"

    accepts_nested_attributes_for :baggage_request_to
end
