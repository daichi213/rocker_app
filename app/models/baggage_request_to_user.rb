class BaggageRequestToUser < ApplicationRecord
  belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
  has_many :messages, class_name: "Message"
  belongs_to :requires, class_name: "User"
  belongs_to :required, class_name: "User"

  def BaggageRequestToUser.get_baggage_request_to_in_required(user_id, baggage_request_id)
    BaggageRequestToUser.where(
      "required_id LIKE ? ", user_id
    ).includes(
      :baggage_request_to
    ).find_by(
      baggage_request_id: baggage_request_id
    )
  end
end
