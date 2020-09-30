class Solution < ApplicationRecord
  belongs_to :inquiry
  has_many :inquiry_solution_contents, as: :contentable

  accepts_nested_attributes_for :inquiry_solution_contents

end
