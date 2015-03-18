class CommentsController < ApplicationController
   def index
    question = Question.find_by(id: params[:id])
    @question_comments = question.comments
    @answer_comments = {}
    question.answers.each do |answer|
      @answer_comments[answer.id] = answer.comments
    end

    # Go over this logic tommorow, should have an array of comments
    # inside of a hash with key of answer id and value of comments

  end

  def new
    @comment = Comment.new
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
