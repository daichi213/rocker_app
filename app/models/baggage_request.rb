class BaggageRequest < ApplicationRecord
    belongs_to :users, class_name: "User"
    #  optional: true
    has_many :to_users, class_name: "BaggageRequestToUser"

    accepts_nested_attributes_for :to_users

    def BaggageRequest.extract(str)
        str.scan(/\d{1,}/)
    end

    def BaggageRequest.convert_to_integer(ary)
        BaggageRequest.extract(ary).map {|i| i.to_i}
    end

    # 配列でリクエスト先を出力
    def required
        BaggageRequest.convert_to_integer(self.required_for)
    end
end