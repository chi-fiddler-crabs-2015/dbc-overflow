class Question < ActiveRecord::Base
  attr_accessor :new_tags
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
    self.votes.inject(0) {|x, y| x + y.value}
  end

  def answer_count
    self.answers.count
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

  def new_tags=(tags_from_form)
    self.new_tags = tags_from_form.gsub(",", "").split(' ')
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
