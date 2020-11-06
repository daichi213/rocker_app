class BaggagesController < ApplicationController
  include UsersHelper
  before_action :logged_in_user
  before_action :correct_user

  # TODO BAGGAGE SIZEを受け入れ可能サイズへ変更

  def new
    @request = BaggageRequest.new
    @users = User.all
    @prefecture_names = combination_city_and_state(@users).values.uniq
    @city_names = combination_city_and_state(@users).to_a
  end

  # フォームの作成アクション
  def create
    @request = current_user.active_requires.build(request_params)
    @users = User.all
    @prefecture_names = combination_city_and_state(@users).values.uniq
    @city_names = combination_city_and_state(@users).to_a
    if @request.save
      # debugger
      # リクエスト先の処理
      # TODO strong parameterに書き換え
      @error_user_name = []
      params[:baggage_request][:required_id].each do |required_id|
        @request_to = @request.to_users.create(required_id: required_id,
                                               requires_id: current_user.id,
                                               del_flag: 0)
        # debugger
        if !@request_to.valid?
          @error_user_name.push("#{User.find_by(id: required_id).name},")
        end
      end
      # debugger
      if !@error_user_name.empty?
        flash[:error] = "#{@error_user_name}さんへの送信に失敗しました"
      end
      flash[:success] = "送信に成功しました"
      redirect_to current_user
    else
      render 'new'
    end
  end

  # 受けているリクエストの一覧ページ
  def index
    @baggage_requests = current_user.required_baggage
    # debugger
  end

  # リクエストの詳細・承認ページ
  def receives
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @user = @baggage_request.user
  end

  # リクエストの受け手側の承認時に使用するアクション
  def update
    # リクエストの承認手続き
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @baggage_request_flag = @baggage_request.update_attribute(:approval_flag, 1)
    @to_users_flag = @baggage_request.to_users.update_all(del_flag: 1)
    # debugger
    @request_to_transaction = @baggage_request.to_users.find_by(required_id: params[:id])
    @request_to_transaction.update_attribute(:del_flag, 0)
    # debugger
    if @baggage_request_flag && @to_users_flag
      redirect_to user_path current_user
    else
      render 'receives'
    end
  end

  def refuse
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @to_users_flag = @baggage_request.to_users.find_by(required_id: current_user.id).update(del_flag: 1)
    if @to_users_flag
      redirect_to user_path current_user
    else
      render 'receives'
    end
  end

  def approval_requests
    @approval_requests = current_user.approval_requests
  end

  def intend_to_requests
    @intend_to_requests = current_user.requiring_baggage
  end

  def intend_to_request_show
    @intend_to_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @to_users = @intend_to_request.to_users
  end

  private

  def request_params
    params.require(:baggage_request).permit(:request_content,
                                            :baggage_content,
                                            :about_baggage_size_h,
                                            :about_baggage_size_l,
                                            :about_baggage_size_w,
                                            :from_time,
                                            :to_time,
                                            :transaction_message,
                                            { :to_users => [] }).merge(
                                              approval_flag: 0,
                                              leaver_start_authenticate: 0,
                                              receiver_start_authenticate: 0,
                                              leaver_end_authenticate: 0,
                                              receiver_end_authenticate: 0,
                                              leaver_point: 0,
                                              receiver_point: 0,
                                              cancelled_flag: 0
                                            )
  end
end
