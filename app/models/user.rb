# class User < ApplicationRecord
class User < ActiveRecord::Base

  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(email, password) 
    @user = self.find_by_email(email.strip.downcase)
    
    if @user && @user.authenticate(password)
      return @user
    else 
      return nil
    end
  end

end
