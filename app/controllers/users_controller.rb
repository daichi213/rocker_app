class UsersController < ApplicationController
  include UsersHelper

  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    # @usersのstateを抽出
    @prefecture_names = combination_city_and_state(@users).map { |city_and_state| city_and_state[1]}.uniq
    @city_names = combination_city_and_state(@users).to_a
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # TODO POSTCODEからの住所自動入力機能実装
  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attributes(state: @user.prefecture_name)
      @user.picture = "/uploads/user/picture/default.jpg" unless @user.picture
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.update_attributes(state: @user.prefecture_name)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User delete"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :sex, :birthday,
                                 :occupation,
                                 :postcode, :prefecture_code,
                                 :city, :street, :house,
                                 :email, :password,
                                 :password_confirmation,
                                 :picture,
                                 receivable_baggages_attributes: [
                                   # :large_scale_baggage,
                                   # :heavy_weight_baggage,
                                   # :precision_machine_baggage,
                                   # :dont_reverse_baggage,
                                   # :broken_article,
                                   # :refrigerated_baggage,
                                   # :feezed_baggage,
                                   :about_baggage_size_w,
                                   :about_baggage_size_l,
                                   :about_baggage_size_h
                                 ])
  end
end
