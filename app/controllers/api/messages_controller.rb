class Api::MessagesController < ApplicationController
  def index
    @baggage_request_to_user = BaggageRequestToUser.find_by(id: params[:baggage_request_to_id])
    @messages = @baggage_request_to_user.messages
    # params[:id]にAjaxで指定した値が入っていない
    # →User.idの値が格納されてしまっている
    debugger
    last_message_id = params[:id].to_i
    @messages = @baggage_request_to_user.messages.includes(:user).where("id > ?", last_message_id)
  end
end
