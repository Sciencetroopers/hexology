class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to pages_question_path
    end  
  end
end
