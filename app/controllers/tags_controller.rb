class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to questions_path(@tag.id)
    else
      render :new, notice: "You tag was invalid"
    end
  end

  def show
    @tags = question.tags
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def question
    Question.find_by(id: params[:id])
  end

  def tag_params
    params.require(:tag).permit(:title)
  end
end
