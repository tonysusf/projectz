class WelcomeController < ApplicationController

  def index
    @questions = Question.all
  end

  def home
  end

end
