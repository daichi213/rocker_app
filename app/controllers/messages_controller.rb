class MessagesController < ApplicationController

    def new
        @message = Message.new
        @to_user = User.find_by(id: params[:to_user_id])
    end

    def create
        @message = current_user.messages.new(message_params)
        @to_user = User.find_by(id: params[:to_user_id])
        if @message.save
            respond_to do |format|
                format.html {redirect_to message_page_path(current_user, @to_user)}
                format.json
            end
        else
            render 'new'
        end
    end

    private

        def message_params
            params.require(:message).permit(:content)
        end
end
