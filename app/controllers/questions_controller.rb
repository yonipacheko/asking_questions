class QuestionsController < ApplicationController
  def index
    #@questions = Question.unsolved_questions(params)
    @questions = Question.unsolved_questionss
    #@users = User.find(:all, :conditions => {:show => true})
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

  def show
   # binding.pry
    @answer = Answer.new
    @question = Question.find(params[:id])
    @vote = Vote.new
  end

  def edit
    @question = current_user.questions.where(id: params[:id]).first
  end
  def update
    @question = current_user.questions.where(id: params[:id]).first
    if @question.update_attributes(resolving_params)
      flash[:success] = "you question has been updated"
      redirect_to @question
    else
      render 'edit'
    end
  end
  def your_questions
    @questions = current_user.questions.all
  end


  private

  def resolving_params
    params.require(:question).permit!
  end
end