class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :baggage_request, optional: true
end
