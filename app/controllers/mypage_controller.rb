class MypageController < ApplicationController
  def index
    @questions = Question.where(user_id: current_user.id)
    @favorite_questions = Question.where(id:
       Favorite.where(user_id: current_user.id).pluck(:question_id))
  end
end
