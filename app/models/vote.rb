class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :tally, polymorphic: true
  has_many :questions
  has_many :comments
end
