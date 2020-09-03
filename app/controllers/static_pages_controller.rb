class StaticPagesController < ApplicationController
  def home
    # @position = current_user.positions.new
    gon.users_positions = User.all.map { |user| [user.name, user.latitude, user.longitude] }
  end

  # TODO USERがどこからリクエストを送るかをdbへ格納するための処理を記述する
  def create
  end

  def about
  end
end
