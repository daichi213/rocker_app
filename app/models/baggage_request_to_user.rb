class BaggageRequestToUser < ApplicationRecord
  # 以下のBaggageRequestテーブルへはrailsの仕様の関係上アクセスできない
  belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
  has_many :messages, class_name: "Message"
  belongs_to :requires, class_name: "User"
  belongs_to :required, class_name: "User"

  def required?(user)
    self.required_id == user.id
  end
end
