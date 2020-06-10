class Request < ApplicationRecord
    belongs_to :transactions, class_name: "Transaction"
end
