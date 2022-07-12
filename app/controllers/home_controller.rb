class HomeController < ApplicationController
  def index
    @questions = Question.all.order(id: 'DESC').limit(5)
  end
end
