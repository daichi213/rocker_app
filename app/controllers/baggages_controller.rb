class BaggagesController < ApplicationController
  def new
    @request = BaggageRequest.new
    @users = User.all
  end

  # フォームの作成アクション
  def create
    @request = current_user.request_content.new(request_params)
    # TODO strong parameterに書き換え
    # TODO "0"を削除要検討
    @required_ids = params[:baggage_request][:baggage_request_to_attributes]["0"][:required_id]
    # @required_ids.each do |required|
    #   @request.required_id = required
    # end
    if @request.save
      flash[:success] = "送信に成功しました"
      redirect_to current_user
    else
      render 'new'
    end
  end

  # request_formへユーザーの追加用アクション
  # hidden_fieldなどで値を保持するか
  def destination
    # newアクションからリダイレクトされた場合
    @request_destination = User.active_requires.create!(requires_id: current_user.id)
  end

  # 受けているリクエストの一覧ページ
  def index
  end

  # リクエストの詳細・承認ページgit
  def receives
  end

  # updateですがリクエストの受け手側の承認時に使用するアクションになります。
  def update

  end

  # 過去に受けたリクエストの履歴
  def received
  end

  private

    def request_params
      params.require(:baggage_request).permit(:request_content,
                                      :baggage_content,
                                      :from_day,
                                      :from_time,
                                      :to_day,
                                      :to_time,
                                      :transaction_message
                                      )
    end
    
end
