class Inquiry < ApplicationRecord
  belongs_to :user
  has_many :inquiry_solution_contents, as: :contentable
  has_one :solution

  # accepts_nested_attributes_for :inquiry_solution_contents, allow_destroy: true

  validates :title, presence: true

  def Inquiry.list_of_title
    ["パスワード関係",
     "サイトの使用方法について",
     "取引関係について",
     "サイトの不具合の報告",
     "その他"]
  end

  def dress_contents
    contents = []
    Inquiry.get_inquiry_solution(self.id).map{|i| contents << InquirySolutionContent.find(i)}
    names = contents.map{|content| content.contentable_type == "Inquiry" ? content.contentable.user.name : "管理者"}
    return contents, names
  end

  def Inquiry.get_inquiry_solution(inquiry_id)
    arr = []
    inquiry = Inquiry.find_by(id: inquiry_id)
    inquiry.inquiry_solution_contents.map{|content| arr << content.id}
    inquiry.solution.inquiry_solution_contents.map{|content| arr << content.id}
    arr.sort!
  end
end
