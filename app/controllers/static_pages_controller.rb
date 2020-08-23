class StaticPagesController < ApplicationController
  def home
    gon.current_user = current_user
  end

  def about
  end
end
