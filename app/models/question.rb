class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :response, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :question_tags, dependent: :destroy
  has_many :tags, through: :question_tags
  has_many :votes, as: :tally, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :user, presence: true
  validate :title_must_not_be_nil
  validate :content_must_not_be_nil

  def vote_count
  end

  def content_must_not_be_nil
    if self.content.length == 0
      errors.add(:content, "You entered a blank description.")
    end
  end

  def title_must_not_be_nil
    if self.title.length == 0
      errors.add(:title, "You entered a blank title")
    end
  end

end
