class BaggageRequest < ApplicationRecord
    has_many :baggage_request_to, class_name: "BaggageRequestToUser",
                        foreign_key: "baggage_request_id"

    accepts_nested_attributes_for :baggage_request_to
end
