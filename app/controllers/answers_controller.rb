class AnswersController < ApplicationController

  def index
    puts "--------------------------------------------"
    puts params
    @answers = Question.find_by(id: params[:question_id]).answers
  end

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
