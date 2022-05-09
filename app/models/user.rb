class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  
  has_secure_password
  
  validates :first, :last, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :password, :length => { :minimum => 8 }
  # validates :last, presence: true
  # validates :email, presence: true 
  # validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    @user = User.find_by_email(email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
