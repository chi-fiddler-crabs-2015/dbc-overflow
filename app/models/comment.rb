class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :response, polymorphic: true

  validates :content, presence: true
  validates :user, presence: true
  validates :response, presence: true
  validate :content_must_not_be_nil

  def content_must_not_be_nil
    if self.content.length == 0
      errors.add(:content, "You entered a blank comment")
    end
  end

end
