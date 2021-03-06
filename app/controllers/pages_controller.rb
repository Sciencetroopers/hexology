class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:contact, :rules]

  def question
    if current_user.question_id == 16
      redirect_to pages_winner_path
    else
      @q_id = current_user.question_id
      @question = Question.find(@q_id)
    end
  end

  def check
    @q_id = current_user.question_id
    @question = Question.find(@q_id)
    @answer = params[:answer]
    if @answer == @question.answer
      current_user.update_attribute(:question_id, @q_id + 1)
      if current_user.question_id == 16
        redirect_to pages_winner_path
      else
        redirect_to pages_question_path
      end
    else
      flash[:notice] = "Wrong Answer. Try Again."
      redirect_to pages_question_path
    end
  end

  def contact
  end
end
