class BaggageRequestToUser < ApplicationRecord
    belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
    belongs_to :in_transaction, class_name: "Transaction", optional: true
end
