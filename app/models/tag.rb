class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :title, presence: true, uniqueness: true
  validate :title_must_not_be_nil

  def title_must_not_be_nil
    if self.question.length == 0
      errors.add(:title, "You entered a blank title")
    end
  end
end
