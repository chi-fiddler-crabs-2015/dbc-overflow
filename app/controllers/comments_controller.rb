class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = parent.comments.new(comment_params)

    if @comment.save
      redirect_to questions_path(question.id)
    else
      render questions_path(question.id), notice: "Your comment can not be blank"
    end
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
