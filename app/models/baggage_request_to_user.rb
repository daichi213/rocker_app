class BaggageRequestToUser < ApplicationRecord
    belongs_to :requires, class_name: "User"
    belongs_to :required, class_name: "User"
    belongs_to :baggage_request, class_name: "BaggageRequest"
end
