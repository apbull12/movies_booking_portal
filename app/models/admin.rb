class Admin < ApplicationRecord
  has_secure_password
  validates_confirmation_of :name, :password
  validates_presence_of :password_confirmation, :if => :password_digest_changed?
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
