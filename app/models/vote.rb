class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :tally, polymorphic: true
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :tally, presence: true
end
