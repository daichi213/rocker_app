class Message < ApplicationRecord
  belongs_to :baggage_request_to_user, class_name: "BaggageRequestToUser"
  belongs_to :user

  validates :content, presence: true

  def Message.check_dont_read_message_required(user_id)
    Message.includes(
      :baggage_request_to_user
    ).where(
      "required_id LIKE ?",
      user_id
    ).references(
      :baggage_request_to_user
    ).where(
      "user_id NOT LIKE ? AND read_flag LIKE ?", user_id, 0
    ).count
  end

  def Message.check_dont_read_message_requires(user_id)
    Message.includes(
      :baggage_request_to_user
    ).where(
      "requires_id LIKE ?",
      user_id
    ).references(
      :baggage_request_to_user
    ).where(
      "user_id NOT LIKE ? AND read_flag LIKE ?", user_id, 0
    ).count
  end

  # not edit
  def Message.check_dont_read_message_in_approval(user_id)
    Message.includes(
      :baggage_request_to_user
    ).where(
      "requires_id LIKE ?",
      user_id
    ).references(
      :baggage_request_to_user
    ).where(
      "user_id NOT LIKE ? AND read_flag LIKE ?", user_id, 0
    ).count
  end

  # not edit
  def Message.check_dont_read_message_in_intend_to(user_id)
    Message.includes(
      :baggage_request_to_user
    ).where(
      "requires_id LIKE ?",
      user_id
    ).references(
      :baggage_request_to_user
    ).where(
      "user_id NOT LIKE ? AND read_flag LIKE ?", user_id, 0
    ).count
  end
end
