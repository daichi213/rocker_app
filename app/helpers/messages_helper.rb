module MessagesHelper
  def judgement_to_destination(baggage_request_to_user, user)
    if baggage_request_to_user.required?(user)
      @user = baggage_request_to_user.requires
    else
      @user = User.find_by(id: baggage_request_to_user.required_id)
    end
  end
end
