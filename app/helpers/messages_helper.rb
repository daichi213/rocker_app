module MessagesHelper
  def judgement_to_destination(baggage_request_to_user, user)
    if baggage_request_to_user.required?(user)
      @user = baggage_request_to_user.requires
    else
      @user = baggage_request_to_user.required
    end
  end
end
