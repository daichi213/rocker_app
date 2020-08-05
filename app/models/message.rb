class Message < ApplicationRecord
    belongs_to :user, class_name: User
    # TODO VALIDATION追加
end
