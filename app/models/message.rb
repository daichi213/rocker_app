class Message < ApplicationRecord
    belongs_to :baggage_request_to_user, class_name: "BaggageRequestToUser"
    belongs_to :user
    # TODO VALIDATION追加
end
