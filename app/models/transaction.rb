class Transaction < ApplicationRecord
    belongs_to :require, class_name: "BaggageRequestToUser"
end
