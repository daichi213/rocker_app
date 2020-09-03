class Transaction < ApplicationRecord
  has_one :require, class_name: "BaggageRequestToUser"
  # TODO VALIDATION追加
end
