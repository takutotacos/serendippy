class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :discoveries

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6}

  has_secure_password
end