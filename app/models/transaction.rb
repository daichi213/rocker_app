class Transaction < ApplicationRecord
    belongs_to :require, class_name: "Require"
end
