class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(resolving_params)
    @answer.user = current_user

    if @answer.save
      flash[:success] = "your answer has been posted"
      redirect_to question_path(@question)
    else
      render 'questions/show'

    end
  end


  def vote
    #binding.pry
    @question = Question.find(params[:question_id])
    @questions = Question.all
    @answer = Answer.where(id: params[:id]).first
    vote = Vote.new(voteable: @answer, user: current_user, vote: params[:vote] )
    if vote.save
      flash[:notice] = 'Your vote was counted'
      redirect_to question_path( @question )
    else
      #binding.pry
      flash[:error] = vote.errors.full_messages.first  # we are bringing the message from the Model to the view!
      #flash[:error] = "You can't vote more than one time"
      #render 'questions/show'
      redirect_to question_path(@question)

    end
    #if answer.votes.find_by(user: current_user)
    #  flash[:alert] = 'A user can vote 1 time!'
    #else
    #  flash[:notice] = 'Your vote was counted'
    #  redirect_to question_path(@question)
    #end
  end


  private

  def resolving_params
    params.require(:answer).permit!
  end
end