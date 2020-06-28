class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :edit, :update, :destroy,
                                      :following, :followers]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    # ここで、paginateメソッドを使用しているためviewsでは引数を指定する必要はない
    @users = User.paginate(page: params[:page])

    @search_params = user_search_params

  end

  # def search
  #   lat = params[:latitude]
  #   lng = params[:longitude]
  #   range = params[:range]

  #   @users = User.all.within(range, origin: [lat, lng])
  #   # 現在地から最も近いユーザーのidを取得
  #   @closest_user_id = @users.closest(origin: [lat, lng]).id
  # end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

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

  # def available_baggage_new
  #   @available_baggage = User.new()
  # end

  # def available_baggage
  #   @available_baggage = User.new(available_baggage_params)
  #   if @available_baggage.save
  #     flash[:success] = "編集に成功しました"
  #     redirect_to root_url
  #   else
  #     render "available_baggage_new"
  #   end
  # end

  def edit
    # debugger
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # debugger
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

  def leaved_baggage
    @transaction = Transaction.new
  end

  def leaved
    @transaction = Transaction.new(request_params)
    if @transaction.save
      flash[:success] = "送信に成功しました"
      # redirect先の設定
    else
      render 'leaved_baggage'
    end
  end

  # 受信したリクエストを表示させるアクション
  def received_baggage

  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
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
                                  :about_baggage_size_h])
    end

    def request_params
      params.require(:request).permit(:request_content,
                                      :baggage_content,
                                      :from_day,
                                      :from_time,
                                      :to_day,
                                      :to_time,
                                      :transaction_message)
    end

    def user_search_params
      # permit内にデータが内場合に例外を発生させないための記法
      params.fetch(:search, {}).permit(:name, :sex, :state, 
                                      :city, :street, :house)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
