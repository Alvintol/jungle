require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.new({
      first: 'Bob',
      last: 'Saget',
      email: 'bob.saget@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    })
  end

  describe 'Users' do
    it 'returns true if created User is valid' do
      expect(@user.valid?).to be_truthy
    end

    it 'returns false if created User is not valid' do
      @user.email = nil
      @user.password = 'test'
      @user.save
      expect(@user.valid?).to be_falsey
    end

    it 'returns false if email is not unique' do
    @user2 = User.new({
      first: 'Bob',
      last: 'Saget',
      email: 'bob.saget@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    })
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include "Email has already been taken"
    expect(@user2.valid?).to be_falsey
    end

    it 'returns false if email is not unique, also not case-sensitive' do
    @user2 = User.new({
      first: 'Bob',
      last: 'Saget',
      email: 'BOB.SAGET@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    })
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include "Email has already been taken"
    expect(@user2.valid?).to be_falsey
    end

    it 'returns true if email is unique' do
    @user2 = User.new({
      first: 'Finn',
      last: 'The Human',
      email: 'Adventure.time@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    }) 
    @user.save
    @user2.save
    expect(@user2.valid?).to be_truthy
    end
    
    it 'returns false if first name is nil' do
    @user2 = User.new({
      first: nil,
      last: 'The Human',
      email: 'Adventure.time@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    }) 
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include "First can't be blank"
    expect(@user2.valid?).to be_falsey
    end

    it 'returns false if last name is nil' do
    @user2 = User.new({
      first: 'Finn',
      last: nil,
      email: 'Adventure.time@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    }) 
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include "Last can't be blank"
    expect(@user2.valid?).to be_falsey
    end

    it 'returns false if email is nil' do
    @user2 = User.new({
      first: 'Finn',
      last: 'The Human',
      email: nil,
      password: 'password',
      password_confirmation: 'password'
    }) 
    @user.save
    @user2.save
    expect(@user2.errors.full_messages).to include "Email can't be blank"
    expect(@user2.valid?).to be_falsey
    end
  end
end

# :first, :last, :email, :password, :password_confirmation
# Define validation specs
# Password minimum length
# New authentication (class) method