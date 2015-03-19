class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    question = Question.find_by(id: params[:question_id])
    @answer = question.answers.new(answer_params)

    if @answer.save
      redirect_to question_path(question.id)
    else
      @errors = @answer.errors.full_messages.join(', ')
      render question_path(question.id)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
