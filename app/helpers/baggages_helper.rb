module BaggagesHelper

    def count_request_to_not_reading_in_required(user)
        user.required_baggage.get_request_to_not_reading
    end

    def count_request_to_not_reading_in_requiring(user)
        user.requiring_baggage.get_request_to_not_reading
    end

    def count_request_to_not_reading_in_receives_index(user)
        user.approval_requests.get_request_to_not_reading
    end

    def count_request_to_not_reading_in_leaves_index(user)
        user.intend_to_requests.get_request_to_not_reading
    end

    def count_request_to_not_reading_in_receiving_index(user)
        user.receiving_in_transaction.get_request_to_not_reading
    end

    def count_request_to_not_reading_in_leaving_index(user)
        user.leaving_in_transaction.get_request_to_not_reading
    end
end
