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
    answer = Answer.find_by(id: params[:answer_id])
    question = Question.find_by(id: params[:id])

    # checks if comment belongs to a question or answer
    if answer
      @comment = answer.comments.create(comment_params)
    else
      @comment = question.comments.create(comment_params)
    end

    if @comment.valid?
      redirect_to questions_path(question.id)
    else
      render questions_path(question.id), notice: "Your comment can not be blank"
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

  def comment_params
    params.require(:comment).permit(:content)
  end
end
