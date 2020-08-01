class Transaction < ApplicationRecord
    has_one :require, class_name: "BaggageRequestToUser"
end
