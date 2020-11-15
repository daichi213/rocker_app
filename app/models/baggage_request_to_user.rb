class BaggageRequestToUser < ApplicationRecord
  # 以下のBaggageRequestテーブルへはrailsの仕様の関係上アクセスできない
  belongs_to :baggage_request_to, class_name: "BaggageRequest", optional: true
  has_many :messages, class_name: "Message"
  has_many :transactions, through: :baggage_request_to, source: :transactions
  belongs_to :requires, class_name: "User"
  belongs_to :required, class_name: "User"

  # def BaggageRequestToUser.dont_read_request_in_required(read_user)
  #   BaggageRequestToUser.where(
  #     "required_id LIKE ? AND read_flag LIKE ? AND
  #      del_flag LIKE ?",
  #      read_user, 0, 0
  #   )
  # end

  # def BaggageRequestToUser.dont_read_request_in_requires(read_user)
  #   BaggageRequestToUser.where(
  #     "requires_id LIKE ? AND read_flag LIKE ? AND
  #      del_flag LIKE ?",
  #      read_user, 0, 0
  #   )
  # end

  def dont_read_message(read_user)
    Message.where(
      "read_flag LIKE ? AND 
       baggage_request_to_user_id LIKE ? AND
       user_id NOT LIKE ?",
       0, self.id, read_user
    )
  end

  def check_message(read_user)
    target_messages = self.dont_read_message(read_user)
    target_messages.each do |target_message|
      target_message.update_attribute(:read_flag, 1)
    end
  end
end
