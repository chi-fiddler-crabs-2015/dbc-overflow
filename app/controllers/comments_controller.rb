class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = parent.comments.new(comment_params)
    @comment.update_attributes(user: current_user)

    if @comment.save
      respond_to do |format|
        format.js do
          if parent_string == "answer"
            render partial: 'add_new_ajax_to_a' and return
          else
            render partial: 'add_new_ajax_to_q' and return
          end
        end
        format.any do
          redirect_to question_path(params[:question_id])
        end
      end
    else
      @errors = @comment.errors.full_messages.join(', ')
      render :nothing => true
    end
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:question_id])
  end

  def parent_string
    answer = Answer.find_by(id: params[:answer_id])
    return "answer" if answer
    "question"
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
