class BaggageRequest < ApplicationRecord
  belongs_to :user, class_name: "User"
  #  optional: true
  has_many :to_users, class_name: "BaggageRequestToUser"
  # TODO BaggageRequestとTransactionへの紐付けが難しいため、includesを使用したメソッドを作成する
  has_one :in_transaction, class_name: 'Transaction'

  accepts_nested_attributes_for :to_users

  # TODO VALIDATION追加

  def get_baggage_request_to_in_required(user_id)
    BaggageRequestToUser.get_baggage_request_to_in_required(user_id, self.id)
  end

  def get_baggage_request_to_in_requires(user_id)
    BaggageRequest.to_users.find_by(required_id: user_id)
  end

  # :to_usersで該当する条件をwhere句で取得してそれに紐づくBaggageRequestのレコードを取得
  def BaggageRequest.get_required_baggage_request(user_id)
    BaggageRequest.includes(
      :to_users
    ).where(
      "(required_id = ?) AND (del_flag = ?)", user_id, 0
    ).references(:to_users)
  end

  def BaggageRequest.get_requires_baggage_request(user_id)
    BaggageRequest.where(
      "(user_id = ?) AND (approval_flag = ?)", user_id, 0
    )
  end

  def BaggageRequest.get_intend_to_request(user_id)
    BaggageRequest.where(
      "(user_id = ?) AND (approval_flag = ?)", user_id, 1
    )
  end

  def BaggageRequest.get_receiving_in_transaction(user_id)
    BaggageRequest.includes(
      :to_users
    ).where(
      "required_id LIKE ?", user_id
    ).references(
      :to_users
    ).includes(
      :in_transaction
    ).where(
      "leaver_start_authenticate LIKE ? AND
       receiver_start_authenticate LIKE ? AND
       leaver_end_authenticate LIKE ? AND
       receiver_end_authenticate LIKE ?",
       1, 1, 0, 0
    )
  end

  def BaggageRequest.get_leaving_in_transaction(user_id)
    BaggageRequest.includes(
      :to_users
    ).where(
      "requires_id LIKE ?", user_id
    ).references(
      :to_users
    ).includes(
      :in_transaction
    ).where(
      "leaver_start_authenticate LIKE ? AND
       receiver_start_authenticate LIKE ? AND
       leaver_end_authenticate LIKE ? AND
       receiver_end_authenticate LIKE ?",
       1, 1, 0, 0
    )
  end
end
