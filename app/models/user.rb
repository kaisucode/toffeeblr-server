class User < ApplicationRecord
  before_save { username.downcase! }
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :password, presence: true, length: { maximum: 20, minimum: 3 }
  has_secure_password
end
