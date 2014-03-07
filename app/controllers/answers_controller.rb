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


  private

  def resolving_params
    params.require(:answer).permit!
  end
end