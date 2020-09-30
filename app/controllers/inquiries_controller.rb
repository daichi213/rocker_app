class InquiriesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  before_action :admin_user, only: [:solution]

  def new
    @inquiry = Inquiry.new
    @content = @inquiry.inquiry_solution_contents.build
  end

  # TODO 回答を投稿した後に投稿時に例外発生、httpメソッドを分ける
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @solution = @inquiry.create_solution(del_flag: 0) if @inquiry.solution.nil?
    # debugger
    if @inquiry.save
      @content = @inquiry.inquiry_solution_contents.create(content: params[:inquiry][:inquiry_solution_contents][:content])
      if @content.invalid?
        render 'new'
        return false
      end
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
      @inquiries = current_user.inquiries
    end
  end

  def get_solution
    @inquiry = Inquiry.find_by id: params[:inquiry_id]
    @contents, @names = @inquiry.dress_contents
    @solution_content = @inquiry.solution.inquiry_solution_contents.new
    @inquiry_content = @inquiry.inquiry_solution_contents.new
  end

  def solution
    @inquiry = Inquiry.find_by(id: params[:inquiry_id])
    @solution_content = @inquiry.solution.inquiry_solution_contents.new(content_params)
    if @solution_content.save
      redirect_to get_solution_path(current_user, @inquiry)
      flash[:success] = "回答完了"
    else
      render 'get_solution'
    end
  end

  def inquiry_reply
    @inquiry = Inquiry.find_by id: params[:inquiry_id]
    @inquiry_content = @inquiry.inquiry_solution_contents.new(content_params)
    if @inquiry_content.save
      redirect_to user_path current_user
      flash[:success] = "投稿完了"
    else
      render 'get_solution'
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :title,
      inquiry_solution_contents_attributes: [
        :content
      ]
    ).merge(
      user_id: current_user.id,
      solved_flag: 0,
      del_flag: 0
    )
  end

  def content_params
    params.require(:inquiry_solution_content).permit!
  end
end
