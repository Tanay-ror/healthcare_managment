class User < ApplicationRecord
  has_secure_password
  has_many :health_policies
  has_many :documents
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
