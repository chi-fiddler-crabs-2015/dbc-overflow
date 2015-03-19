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
    @comment = parent.comments.create(comment_params)

    if @comment.valid?
      redirect_to questions_path(question.id)
    else
      render questions_path(question.id), notice: "Your comment can not be blank"
    end
  end

  def show
    question = Question.find_by(id: params[:id])
    @question_comments = question.comments
    @answer_comments = {}
    question.answers.each do |answer|
      @answer_comments[answer.id] = answer.comments
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
