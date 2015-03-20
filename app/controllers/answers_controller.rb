class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    question = Question.find_by(id: params[:question_id])
    @answer = question.answers.new(answer_params)
    @answer.update_attributes(user: current_user)
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      @errors = @answer.errors.full_messages.join(', ')
      puts @errors
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
