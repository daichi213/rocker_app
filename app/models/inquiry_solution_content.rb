class InquirySolutionContent < ApplicationRecord
  # Polymorphic Relation
  # InquiryとSolutionモデルの内容をどちらも関連付けさせている
  belongs_to :inquiry
  belongs_to :solution

  validates :content, presence: true
end
