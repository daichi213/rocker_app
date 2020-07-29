class BaggageRequestToUser < ApplicationRecord
    belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
end
