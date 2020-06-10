class Baggage < ApplicationRecord
    belongs_to :user, class_name: "User"
    validates :user_id, presence: true
    validates :about_baggage_size_w, presence: true
    validates :about_baggage_size_l, presence: true
    validates :about_baggage_size_h, presence: true

    def Baggage.baggage_size_convert(size)
        sizeArray = size.split("<")
        sizeArray.each do |s|
            s.to_i
        end
    end
end
