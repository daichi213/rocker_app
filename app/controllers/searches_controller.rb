class SearchesController < ApplicationController
  def user_search
    lat = params[:latitude]
    lng = params[:longitude]
    range = params[:range]

    @users = User.all.within(range, origin: [lat, lng])
    # 現在地から最も近いユーザーのidを取得
    @closest_user_id = @users.closest(origin: [lat, lng]).id
  end

  def aea_search
  end

  private

    def user_search_params
      # permit内にデータが内場合に例外を発生させないための記法
      params.fetch(:search, {}).permit(:name, :sex, :state, 
                                      :city, :street, :house)
    end

end
