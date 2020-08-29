class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :display_dont_read_message

  include SessionsHelper

  # def display_dont_read_message
  #  messages_num = current_user.dont_read_message.count
  #  @dont_read_messages_num = session[:dont_read_message_number] - messages_num
  # end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
