class VotesController < ApplicationController

  def create
    parent.votes.create(value: params[:vote_value], user: current_user)
    redirect_to :back
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:question_id])
  end

end
