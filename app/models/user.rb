class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates :userid, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

# create SESSIONS for the active user, and terminate on signing out

end
