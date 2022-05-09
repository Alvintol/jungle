class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  
  has_secure_password
  
  validates :first, :last, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  # validates :last, presence: true
  # validates :email, presence: true 
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
end
