class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    question = Question.find_by(id: params[:id])
    @answer = question.answers.new

    if @answer.valid?
      redirect_to questions_path(question.id)
    else
      render questions_path(question.id), notice: "You Answer was invalid"
    end
  end

  def show
    @answer = Answer.find_by(params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def answer_params
    params.require(:Answer).permit(:content)
  end
end