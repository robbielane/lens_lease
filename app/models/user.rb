class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :rentals
  has_secure_password

  enum role: %w(default admin)
end
