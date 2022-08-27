class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id #いい方法ないかなあ？
    @answer.question_id = @question.id
    if @answer.save
      flash[:success] = '回答が投稿されました。'
      redirect_to question_path(@question.id)
    else
      flash[:danger] = '回答の投稿に失敗しました。'
      render 'new'
    end
  end
  
  def confirm
    @answer = Answer.new(answer_params)
  end
  
  private
    def answer_params
      params.require(:answer).permit(:body)
    end
end
