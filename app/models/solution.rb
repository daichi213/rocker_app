class Solution < ApplicationRecord
  belongs_to :inquiry
  has_many :inquiry_solution_contents, class_name: 'InquirySolutionContent'
  has_many :inquiries, through: :inquiry_solution_contents, source: :inquiry
  validates :content, presence: true
end
