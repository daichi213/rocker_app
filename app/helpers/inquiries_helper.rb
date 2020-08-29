module InquiriesHelper
    def message_number
        if current_user.dont_read_inquiry.empty?
            "Help List"
        else
            "Help List #{current_user.dont_read_inquiry.count}"
        end
    end
end
