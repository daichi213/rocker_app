class Api::SearchController < ApplicationController
  def search
    @current_position_latitude = params[:latitude]
    @current_position_longitude = params[:longitude]
    # range = params[:range]
    @result_user = User.near([@current_position_latitude, @current_position_longitude], 5, units: :km)
  end
end
