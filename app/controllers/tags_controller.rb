class TagsController < ApplicationController
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
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private
end
