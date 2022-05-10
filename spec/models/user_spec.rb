require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.create({
      first: 'Bob',
      last: 'Saget',
      email: 'bob.saget@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
    })
  end

  describe 'Validations' do
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
      @user2 = User.create({
        first: 'Bob',
        last: 'Saget',
        email: 'bob.saget@hotmail.com',
        password: 'password',
        password_confirmation: 'password'
        })
        expect(@user2.errors.full_messages).to include "Email has already been taken"
      end
      
      it 'returns true if email is unique' do
        @user2 = User.create({
          first: 'Finn',
          last: 'The Human',
          email: 'Adventure.time@hotmail.com',
          password: 'password',
          password_confirmation: 'password'
          }) 
          
          expect(@user2.valid?).to be_truthy
        end
        
        it 'returns false if first name is nil' do
          @user2 = User.create({
            first: nil,
            last: 'The Human',
            email: 'Adventure.time@hotmail.com',
            password: 'password',
            password_confirmation: 'password'
    }) 
    @user2.save
    expect(@user2.errors.full_messages).to include "First can't be blank"
  end
  
  it 'returns false if last name is nil' do
    @user2 = User.create({
      first: 'Finn',
      last: nil,
      email: 'Adventure.time@hotmail.com',
      password: 'password',
      password_confirmation: 'password'
      }) 
      expect(@user2.errors.full_messages).to include "Last can't be blank"
    end
    
    it 'returns false if email is nil' do
      @user2 = User.create({
        first: 'Finn',
        last: 'The Human',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
        })
        expect(@user2.errors.full_messages).to include "Email can't be blank"
      end

      it 'returns false if password is not confirmed' do
        @user.password = 'wrongPassword'
        @user.save
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      
      it 'returns true if password length is at least 8 characters' do
        @user2 = User.create({
          first: 'Finn',
          last: 'The Human',
          email: 'Adventure.time@hotmail.com',
          password: 'password',
      password_confirmation: 'password'
    }) 
    expect(@user2.password.length).to eql(8)
    end

    it 'returns true if password length is at least 8 characters' do
    @user2 = User.create({
      first: 'Finn',
      last: 'The Human',
      email: 'Adventure.time@hotmail.com',
      password: 'short',
      password_confirmation: 'short'
    }) 
    expect(@user2.password.length).to_not eql(8)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'authenticates with valid credentials' do
      @user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to_not be(nil)
    end
    
    it 'authenticates with invalid password credentials' do
      @user = User.authenticate_with_credentials(@user.email, 'wrongPassword')
      expect(@user).to be(nil)
    end

    it 'authenticates with invalid email credentials' do
      @user = User.authenticate_with_credentials('wrong@email.com', @user.password)
      expect(@user).to be(nil)
    end

    it 'authenticates with valid whitespace filled email credentials' do
      @user = User.authenticate_with_credentials('    bob.saget@hotmail.com       ', @user.password)
      expect(@user).to_not be(nil)
    end

    it 'authenticates with valid email credentials NOT case sensitive' do
      @user = User.authenticate_with_credentials('BOB.SAGET@hotmail.com', @user.password)
      expect(@user).to_not be(nil)
    end
  end
end
