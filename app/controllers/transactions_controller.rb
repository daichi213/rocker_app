class TransactionsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user

  def receives_index
    @baggage_requests = current_user.required_baggage
  end

  def leaves_index
    @baggage_requests = current_user.intend_to_requests
  end

  def receiving_index
  end

  def leaving_index
  end

  def receives_show
  end

  def leaves_show
  end

  # 取引開始
  def transaction_start
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @transaction = @baggage_request.in_transaction.update(started_at: Time.zone.now)
  end

  def receiving_show
  end

  def leaving_show
  end

  # 取引終了アクション
  def transaction_terminate
    @baggage_request = BaggageRequest.find_by(id: params[:baggage_request_id])
    @transaction = @baggage_request.in_transaction.update(started_at: Time.zone.now)
  end

  def transaction_history
  end
end
