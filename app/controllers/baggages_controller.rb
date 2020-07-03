class BaggagesController < ApplicationController
  def new
    @request = BaggageRequest.new
  end

  def create
    @request = BaggageRequest.new(request_params)
    if @request.save
      flash[:success] = "送信に成功しました"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def index
  end

  def receives
  end

  # updateですがリクエストの受け手側の承認時に使用するアクションになります。
  # 佐藤さんからベストな命名を拝聴
  def update

  end

  def received
  end

  private

    def request_params
      params.require(:request).permit(:request_content,
                                      :baggage_content,
                                      :from_day,
                                      :from_time,
                                      :to_day,
                                      :to_time,
                                      :transaction_message)
    end
end
