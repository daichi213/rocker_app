class Api::MessagesController < ApplicationController
  def index
    @baggage_request_to_user = BaggageRequestToUser.find_by(id: params[:baggage_request_to_id])
    @messages = @baggage_request_to_user.messages
    last_message_id = params[:id].to_i
    debugger
    @messages = @baggage_request_to_user.messages.includes(:user).where("id > ?", last_message_id)
  end
end
