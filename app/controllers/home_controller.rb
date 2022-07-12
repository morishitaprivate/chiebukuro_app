class HomeController < ApplicationController
  def index
    @questions = Question.all.order(id: 'DESC').limit(5)
    @favorited_questions =  Question.joins(:favorites).group('favorites.question_id').order('count_all DESC').count
  end
end
