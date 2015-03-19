class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :response
  has_many :votes, as: :tally

  validates :content, presence: true, uniqueness: true
  validates :user, presence: true
  validates :question, presence: true
  validate :content_must_not_be_nil

  def vote_count
  end

  def content_must_not_be_nil
    if self.content.length == 0
      errors.add(:content, "You entered a blank answer")
    end
  end

end
