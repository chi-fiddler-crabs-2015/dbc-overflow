class VotesController < ApplicationController

  def create
    parent.votes.create(value: params[:vote_value], user: current_user)
    @vote = parent.vote_count
    # respond_to do |format|
    #   format.js do
    #       render partial: 'add_ajax_vote' and return
    #     end
    #   format.any do
    #   end
    # end
    redirect_to question_path(params[:question_id])
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:question_id])
  end

end
