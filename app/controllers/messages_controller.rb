class MessagesController < ApplicationController

    def new
        @message = Message.new
        @baggage_request_to_user = BaggageRequestToUser.find_by(id: params[:baggage_request_to_id])
        @messages = @baggage_request_to_user.messages
        # debugger
    end

    def create
        @baggage_request_to_user = BaggageRequestToUser.find_by(id: params[:baggage_request_to_id])
        # debugger
        @message = @baggage_request_to_user.messages.new(message_params)
        # debugger
        if @message.save
            # debugger
            respond_to do |format|
                format.json
            end
        else
            render 'new'
        end
    end

    private

        def message_params
            params.require(:message).permit(:content)
                                    .merge(
                                        user_id: current_user.id
                                    )
        end
end
