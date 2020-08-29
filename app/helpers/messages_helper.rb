module MessagesHelper

    def judgement_to_destination(baggage_request_to_user, current_user)
        if baggage_request_to_user.required_id == current_user.id
            @user = User.find_by(id: baggage_request_to_user.requires_id)
        else
            @user = User.find_by(id: baggage_request_to_user.requires_id)
        end
    end
end
