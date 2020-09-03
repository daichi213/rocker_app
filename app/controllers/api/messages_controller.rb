class Api::MessagesController < ApplicationController
  def index
    @baggage_request_to_user = BaggageRequestToUser.find_by(id: params[:baggage_request_to_id])
    # params[:id]にAjaxで指定した値が入っていない
    # →User.idの値が格納されてしまっている
    # →URLの:idとdata:{id: last_message_id}がconflictした
    last_message_id = params[:last_message_id].to_i
    # TODO TEST COUNT_DONT_READ_MESSAGES
    # session[:dont_read_message_number] += last_message_id
    @messages = @baggage_request_to_user.messages.includes(:user).where("id > ?", last_message_id)
  end
end
