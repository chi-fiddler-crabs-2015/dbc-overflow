class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    question = Question.find_by(id: params[:id])
    @answer = question.answers.new

    if @answer.save
      redirect_to questions_path(question.id)
    else
      @errors = @answer.errors.full_messages.join(', ')
      render new_question_answer
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
