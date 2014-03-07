class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create
end