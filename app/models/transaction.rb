class Transaction < ApplicationRecord
    belongs_to :requests, class_name: "Request"
end
