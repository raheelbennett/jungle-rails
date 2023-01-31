require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'passes when all fields are correctly entered' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test3@gmail.com", password: "Pass123", password_confirmation: "Pass123")
      expect(@user.errors.full_messages).to be_empty
    end
    it 'fails with correct message when passwords do not match' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test1@gmail.com", password: "Pass123", password_confirmation: "Pas5s123")
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'fails with correct message when password is empty' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test1@gmail.com", password: nil, password_confirmation: "Pas5s123")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'fails with correct message when password_confirmation is empty' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test1@gmail.com", password: "Pass123", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'fails with correct message when both password and password_confirmation fields are empty' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test1@gmail.com", password: nil, password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'fails with correct message when email field is empty' do
      @user = User.create(first_name: "June", last_name: "Bug", email: nil, password: "Pass123", password_confirmation: "Pass123")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'fails with correct message when email already exists, regardless of case' do
      @user1 = User.create(first_name: "June", last_name: "Bug", email: "user1@gmail.com", password: "Pass123", password_confirmation: "Pass123")
      @user2 = User.create(first_name: "April", last_name: "Thomas", email: "user1@gmail.COM", password: "Pass123", password_confirmation: "Pass123")
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'fails with correct message when first name is empty' do
      @user = User.create(first_name: nil, last_name: "Bug", email: "test@test.COM", password: "Pass123", password_confirmation: "Pass123")
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'fails with correct message when last name is empty' do
      @user = User.create(first_name: "Adrian", last_name: nil, email: "test@test.COM", password: "Pass123", password_confirmation: "Pass123")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'fails with correct message when password length is too short' do
      @user = User.create(first_name: "June", last_name: "Bug", email: "test1@gmail.com", password: "Pass1", password_confirmation: "Pass1")
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    
    before(:all) do
      @user = User.find_by_email("test1@gmail.com")
    end
    
    it 'returns an instance of the user upon successful authentication' do
      expect(User.authenticate_with_credentials("test1@gmail.com", "Pass123")).to eql(@user)
    end
    it 'returns nil of the user upon unsuccessful authentication with wrong password' do
      expect(User.authenticate_with_credentials("test1@gmail.com", "fhgffd123")).to eql nil
    end
    it 'returns nil of the user upon unsuccessful authentication with wrong email' do
      expect(User.authenticate_with_credentials("test143@gmail.com", "fhgffd123")).to eql nil
    end
     it 'successfully authenicates even when using email with preceeding and trailing spaces' do
      expect(User.authenticate_with_credentials("   test1@gmail.com  ", "Pass123")).to eql(@user)
    end
     it 'successfully authenicates even when using email with mixed cases' do
      expect(User.authenticate_with_credentials(" teST1@gmail.cOM", "Pass123")).to eql(@user)
    end
 
  end

end
