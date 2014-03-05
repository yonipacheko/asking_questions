class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @question = Question.new

  end

  def new
  end

  def create
    #binding.pry
    @question = current_user.questions.build(resolving_params)
    if @question.save
      flash[:success] = "Your question has been posted"
      redirect_to root_path
    else
     # @questions = Question.all
      flash[:notice] = "The form is empty?"
      redirect_to root_path
      #so yr server doesnt get slow:
      #@questions = Question.all
      #render :index
    end

  end


  private

  def resolving_params
    params.require(:question).permit!
  end
end