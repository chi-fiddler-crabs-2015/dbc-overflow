class AnswersController < ApplicationController

  def new
  end

  def create
    question = Question.find_by(id: params[:id])
    @answer = question.answers.new

    if @answer.save
      redirect_to questions_path(question.id)
    else
      render questions_path(question.id), notice: "You Answer was invalid"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
