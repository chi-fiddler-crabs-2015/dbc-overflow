class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path(@question.id)
    else
      render :new, notice: "You question was invalid"
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def question_params
    puts params
    params.require(:question).permit(:title, :content)
  end
end
