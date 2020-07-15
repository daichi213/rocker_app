class BaggageRequestToUser < ApplicationRecord
    belongs_to :leaves, class_name: "User"
    belongs_to :receives, class_name: "User"
    belongs_to :baggage_request, class_name: "BaggageRequest"
    has_one :transactions, class_name: "Transaction",
                            foreign_key: "baggage_request_id"

    validates :baggage_request_id, presence: true, allow_nil: true
end
