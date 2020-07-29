class BaggagesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  
  def new
    @request = BaggageRequest.new
    @users = User.all
  end

  # フォームの作成アクション
  def create
    @request = current_user.active_requires.build(request_params)
    if @request.save
      # リクエスト先の処理
      # TODO strong parameterに書き換え
      params[:baggage_request][:required_id].each do |required_id|
        @request_to = @request.to_users.create(required_id: required_id,
                                            finished_flag: 0)
        # debugger
        if !@request_to.valid?
          @error_user = "#{User.find_by id: required_id},"
        end
      end
      if @error_user
        flash[:error] = "#{@error_user}さんへの送信に失敗しました"
      end
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
    @baggage_requests = current_user.required
    # respond_to do |format|
    #   format.html
    # end
  end

  # リクエストの詳細・承認ページgit
  def receives
    @baggage_request 
  end

  # updateですがリクエストの受け手側の承認時に使用するアクションになります。
  def update

  end

  # 過去に受けたリクエストの履歴
  def transaction_history
    
  end

  private

    def request_params
      params.require(:baggage_request).permit(:request_content,
                                      :baggage_content,
                                      :from_day,
                                      :from_time,
                                      :to_day,
                                      :to_time,
                                      :transaction_message,
                                      {:to_users => []}
                                      )
    end
    
end
