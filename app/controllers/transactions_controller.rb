class TransactionsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def receives_index
    @baggage_requests = current_user.approval_requests
  end

  def leaves_index
    @baggage_requests = current_user.intend_to_requests
  end

  def receiving_index
    @baggage_requests = current_user.receiving_in_transaction
  end

  def leaving_index
    @baggage_requests = current_user.leaving_in_transaction
  end

  def receives_show
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
  end

  def leaves_show
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
  end

  # 取引開始
  def transaction_start
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    if @baggage_request.user_id == current_user.id
      @baggage_request_flag = @baggage_request.update(leaver_start_authenticate: 1)
    else
      @baggage_request_flag = @baggage_request.update(receiver_start_authenticate: 1)
    end
    if @baggage_request.receiver_start_authenticate == 1 && @baggage_request.leaver_start_authenticate == 1
      @transaction_flag = @baggage_request.update(transaction_started_at: Time.zone.now)
    end
    if @baggage_request_flag && @transaction_flag
      flash[:success] = "取引は正常に開始されました"
      redirect_to user_path current_user
    elsif @baggage_request_flag
      flash[:success] = "承認しました。相手の承認をお待ち下さい。"
      redirect_to user_path current_user
    else
      if @baggage_request.user_id == current_user.id
        render 'leaves_show'
      else
        render 'receives_show'
      end
    end
  end

  def receiving_show
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
  end

  def leaving_show
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
  end

  # 取引終了アクション
  def transaction_terminate
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    if @baggage_request.user_id == current_user.id
      @baggage_request_flag = @baggage_request.update(leaver_end_authenticate: 1)
    else
      @baggage_request_flag = @baggage_request.update(receiver_end_authenticate: 1)
    end
    if @baggage_request.receiver_end_authenticate == 1 && @baggage_request.leaver_end_authenticate == 1
      @transaction_flag = @baggage_request.update(transaction_terminated_at: Time.zone.now)
    end
    if @baggage_request_flag && @transaction_flag
      flash[:success] = "取引は正常に終了しました"
      redirect_to user_path current_user
    elsif @baggage_request_flag
      flash[:success] = "承認しました。相手の承認をお待ち下さい。"
      redirect_to user_path current_user
    else
      if @baggage_request.user_id == current_user.id
        render 'leaving_show'
      else
        render 'receiving_show'
      end
    end
  end

  def transaction_history
    @baggage_request = current_user.active_requires
  end
end
