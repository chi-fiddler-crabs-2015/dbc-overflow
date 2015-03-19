class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :response, dependent: :destroy
  has_many :votes, as: :tally, dependent: :destroy

  validates :content, presence: true
  validates :user, presence: true
  validates :question, presence: true
  validate :content_must_not_be_nil


  def vote_count
    self.votes.all.inject(:+)
  end

  def content_must_not_be_nil
    if self.content.length == 0
      errors.add(:content, "You entered a blank answer")
    end
  end

end
