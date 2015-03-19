class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :comments
  has_many :answers
  has_many :votes
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates_length_of :username, :within => 6..20
  validates :password_digest, length: { minimum: 6 }
  validates :email, format: { with: /.+@.+[.].+/ }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/ }

end
