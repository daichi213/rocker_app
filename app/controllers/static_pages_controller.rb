class StaticPagesController < ApplicationController
  def home
    # @position = current_user.positions.new
    gon.users_positions = User.all.map { |user| [user.name, user.latitude, user.longitude] }
    gon.current_user_id = current_user.id if logged_in?
  end

  # TODO USERがどこからリクエストを送るかをdbへ格納するための処理を記述する
  def create
    @user = User.find(1)
    if @user
      log_in @user
      redirect_back_or @user
    end
  end

  def about
  end
end
