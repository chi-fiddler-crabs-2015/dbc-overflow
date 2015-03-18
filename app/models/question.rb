class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :response
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :tally

  def vote_count
  end

end
