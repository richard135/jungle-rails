require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    describe 'The Passwords field' do
      it 'The two passwords must match ' do
        @user = User.new({
          email: '123@hotmail.com',
          password: '123',
          password_confirmation: '123'
          })
        @user.save
        expect(@user.save).to be true
      end
    end

    describe 'The Passwords field' do
      it 'Returns false if passwords do not match ' do
        @user = User.new({
          email: '123@hotmail.com',
          password: '123',
          password_confirmation: '1234'
          })
        @user.save
        expect(@user.save).to be false
      end
    end

    describe 'The password is required' do
      it 'given that password field cannot be blank ' do
        @user = User.new({
          email: '123@hotmail.com',
          password: nil,
          })
        @user.save
        expect(@user.save).to be false
      end
    end

    describe 'The email must be unique' do
      it "given that email already exists" do
        @user = User.create({
          email: '1234@hotmail.com',
          password: '123',
          password_confirmation: '123'
          })
        @user2 = User.new({
          email: '1234@hotmail.com',
          password: '123',
          password_confirmation: '123'
          })
        expect(@user2).to_not be_valid
      end
    end

    describe 'The password minimum length' do
      it "must have a minimum length of 2" do
        @user = User.new({
          email: '1234@hotmail.com',
          password: '1',
          password_confirmation: '1'
          })
        expect(@user).to_not be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do
    describe 'When logging in' do
      it "must have an email that already exists" do
        session[:email] = '123'

      end
    end
  end
end
