class InquiryForm
    include ActiveModel::Model

    concerning :InquiryBuilder do
        def inquiry
          @inquiry ||= Inquiry.new
        end
    end

    concerning :InquirySolutionContentBuilder do
        attr_reader :inquiry_solution_content_attributes

        def inquiry_solution_content
            @inquiry_solution_content_attributes ||= InquirySolutionContent.new
        end

        def inquiry_solution_content_attributes=(attributes)
            @inquiry_solution_content_attributes = InquirySolutionContent.new(attributes)
        end
    end

    attr_accessor :name, :address

    validate :validate_something

    def save
        # バリデーションに引っかかる場合は以降の処理には行かせずfalseをコントローラーに返します
        return false if invalid?

        inquiry.assign_attributes(inquiry_params)
        build_asscociations

        if inquiry.save
          true
        else
          false
        end
    end

    private

    def inquiry_params
      {
        title: title
      }
    end

    def build_asscociations
      inquiry.inquiry_solution_content << inquiry_solution_content
    end

    def validate_something
      # Do something
    end
end