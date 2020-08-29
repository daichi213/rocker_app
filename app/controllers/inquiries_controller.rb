class InquiriesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  before_action :admin_user, only: [:solution]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = current_user.inquiries.new(inquiry_params)
    if @inquiry.save
      flash[:success] = "メッセージの送信に成功しました"
      redirect_to user_path current_user
    else
      render 'new'
    end
  end

  def index
    if current_user.admin?
      @inquiries = Inquiry.all
    else
      @inquiries = current_user.dont_read_inquiry
    end
  end

  def get_solution
    @inquiry = Inquiry.find_by id: params[:inquiry_id]
    @solution = @inquiry.build_solution unless @inquiry.solution
    @solution = @inquiry.solution if @inquiry.solution
  end

  def solution
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @solution = @inquiry.build_solution(solution_params)
    if @solution.save
      @inquiry_up = @inquiry.update(solved_flag:1)
      # TODO TEST
      unless @inquiry_up
        render 'get_solution' 
        return
      end
      redirect_to index_path current_user
      flash[:success] = "回答完了"
    else
      render 'get_solution'
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(
                                      :title, 
                                      :content
                                    ).merge(
                                      solved_flag: 0,
                                      read_flag: 0,
                                      del_flag: 0
                                    )
    end

    def solution_params
      params.require(:solution).permit(:content)
                                    .merge(
                                      read_flag: 0,
                                      del_flag: 0
                                    )
    end
end
