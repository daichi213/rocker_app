class InquirySolutionContent < ApplicationRecord
  # ポリモーフィック関連
  belongs_to :contentable, polymorphic: true
end
