class BaggageRequestToUser < ApplicationRecord
  belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
  belongs_to :in_transaction, class_name: "Transaction", optional: true
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

  # TODO リクエスト時にBaggageRequestToUser.idを取得するメソッドを組む
  def BaggageRequestToUser.get_baggage_request_to_in_requires(user_id, baggage_request_id)
    BaggageRequestToUser.includes(
      :baggage_request_to
    ).where(
      "user_id LIKE ?", user_id
    ).references(
      :baggage_request_to
    )
    # .find_by(
    #     baggage_request_id: baggage_request_id
    # )
  end
end
