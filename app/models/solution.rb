class Solution < ApplicationRecord
    belongs_to :inquiry
    validates :content, presence: true
end
