class Request < ApplicationRecord
    belongs_to :leaver, class_name: "User"
    belongs_to :receiver, class_name: "User"
    belongs_to :transactions, class_name: "Transaction"
end
