class BaggageRequestToUser < ApplicationRecord
    belongs_to :requires, class_name: "User"
    belongs_to :required, class_name: "User"
    belongs_to :baggage_request, class_name: "BaggageRequest"

    validates :baggage_request_id, presence: true, allow_nil: true
    validates :requires_id, presence: true
    validates :required_id, presence: true, allow_nil: true
end
