class User < ApplicationRecord
  has_many :questions
  has_many :answers

  has_secure_password
  has_secure_token

  validates_uniqueness_of :username
  validates_presence_of :email
  validates_presence_of :name
end
