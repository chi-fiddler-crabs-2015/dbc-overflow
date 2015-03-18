class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :response
  has_many :votes, as: :tally

  validates :content, presence: true

  def vote_count
  end

end
