class User < ApplicationRecord
  
  has_secure_password
  
  validates :first, :last, :email, :password, :password_confirmation, presence: true
  validates :email, uniqueness: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :minimum => 8 }

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
