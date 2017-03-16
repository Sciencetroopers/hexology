class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order('created_at ASC')
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:question, :answer)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def authenticate_admin
    redirect_to root_path unless current_user.admin == true
  end
end
