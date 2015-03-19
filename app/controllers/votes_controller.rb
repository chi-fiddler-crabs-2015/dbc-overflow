class VotesController < ApplicationController

  def create
    if params[:vote_type] == "upvote"
      parent.votes.create(value: 1)
    else
      parent.votes.create(value: -1)
    end
  end

  private

  def parent
    answer = Answer.find_by(id: params[:answer_id])
    return answer if answer
    Question.find_by(id: params[:question_id])
  end

end
