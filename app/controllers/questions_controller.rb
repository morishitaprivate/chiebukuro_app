class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(id: 'DESC')
  end

  def new
    @question = Question.new
  end

  def show
    # 引数を渡したいができなかったためとりあえずこれ
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def confirm
    @question = Question.new(question_params)
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      flash[:success] = '質問が投稿されました。'
      redirect_to root_path
    else
      flash[:danger] = '質問投稿に失敗しました。'
      render 'new'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = '削除に成功しました。'
    redirect_to root_path
  end

  private
    def question_params
      params.require(:question).permit(:body, :supplement)
    end
end
