class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find_by(id: params[:question_id])
    @new_answer = @question.answers.new(answer_params)
    @new_answer.update_attributes(user: current_user)
    respond_to do |format|
      if @new_answer.save
        format.js do
          # redirect_to question_path(params[:question_id])
          render partial: 'add_ajax_answer'
        end
      else
        @errors = @new_answer.errors.full_messages.join(', ')
        redirect_to question_path(params[:question_id])
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
