class Transaction < ApplicationRecord
  belongs_to :baggage_request, class_name: "BaggageRequest"
  # TODO VALIDATION追加
end
