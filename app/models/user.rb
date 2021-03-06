class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :comments
  has_many :answers
  has_many :votes, dependent: :destroy
  has_secure_password

  validates :username, :email, :password_digest, presence: true
  validates_uniqueness_of :username, :email
  validates_length_of :username, :within => 6..20
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: /.+@.+[.].+/ }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/ }

end
