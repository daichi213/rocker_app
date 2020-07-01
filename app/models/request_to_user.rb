class RequestToUser < ApplicationRecord
    belongs_to :request, class_name: "Request"
end
