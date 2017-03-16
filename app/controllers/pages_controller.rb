class PagesController < ApplicationController
  before_action :authenticate_user!

  def question
    @q_id = current_user.question_id
    @question = Question.find(@q_id)
  end
end
