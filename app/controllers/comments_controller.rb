class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = parent.comments.new(comment_params)
    @comment.update_attributes(user: current_user)

    if @comment.save
      redirect_to question_path(params[:question_id])
    else
      puts "You went else"
      @errors = @comment.errors.full_messages.join(', ')
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:question_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
