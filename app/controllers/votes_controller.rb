class VotesController < ApplicationController

  def new
  end

  def create


    if @vote.save
      redirect_to questions_path(vote.id)
    else
      render questions_path(vote.id), notice: "You vote was invalid"
    end
  end

end
