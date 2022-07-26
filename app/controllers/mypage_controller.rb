class MypageController < ApplicationController
  def index
    @questions = Question.where(user_id: current_user.id)
  end
end
