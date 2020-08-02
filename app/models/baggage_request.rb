class BaggageRequest < ApplicationRecord
    belongs_to :user, class_name: "User"
    #  optional: true
    has_many :to_users, class_name: "BaggageRequestToUser"
    # TODO BaggageRequestとTransactionへの紐付けが難しいため、includesを使用したメソッドを作成する

    accepts_nested_attributes_for :to_users

    def BaggageRequest.get_required_baggage_request(user_id)
        BaggageRequestToUser.includes(
            baggage_request_to: :user
        ).where(
            "(required_id = ?) AND (del_flag = ?)", user_id, 0
        ).map{|i| i.baggage_request_id}
    end

    def BaggageRequest.get_approval_baggage_request(user_id)
        BaggageRequest.includes(
            :to_users
        ).where(
            "(required_id = ?) AND (del_flag = ?)", user_id, 0
        ).references(:to_users)
    end
end