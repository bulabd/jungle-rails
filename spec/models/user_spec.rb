require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should save a new user when all validations pass" do
      @user = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: "abcde")
      expect(@user).to be_valid
    end

    it "should not save a new user when no first name is specified" do
      @user = User.new(first_name: nil, last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: "abcde")
      expect(@user).to_not be_valid
    end

    it "should not save a new user when no last name is specified" do
      @user = User.new(first_name: "Bob", last_name: nil, email: "test@test.com", password: "abcde", password_confirmation: "abcde")
      expect(@user).to_not be_valid
    end

    it "should not save a new user when no password is specified" do
      @user = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: nil, password_confirmation: "abcde")
      expect(@user).to_not be_valid
    end

    it "should not save a new user when no password-confirmation is specified" do
      @user = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "should not save a new user when the password's length is smaller than 3" do
      @user = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "ab", password_confirmation: "ab")
      expect(@user).to_not be_valid
    end

    it "should not save a new user when the password does not match the confirmation" do
      @user = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: "abcd")
      expect(@user).to_not be_valid
    end

    it "should not save a new user when email is not unique" do
      @user1 = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: "abcde")
      @user1.save
      @user2 = User.new(first_name: "Will", last_name: "Smith", email: "TEST@TEST.com", password: "12345", password_confirmation: "12345")
      expect(@user2).to_not be_valid
    end


    describe '.authenticate_with_credentials' do
      before do
        @user1 = User.new(first_name: "Bob", last_name: "Roberts", email: "test@test.com", password: "abcde", password_confirmation: "abcde")
        @user1.save
      end

      it "should authenticate a user if he enters the right credentials" do
        login_success = User.authenticate_with_credentials("test@test.com", "abcde")
        expect(login_success).to be_truthy
      end

      it "should not authenticate a user if he enters the wrong credentials" do
        login_success = User.authenticate_with_credentials("test2@test.com", "wrongpass")
        expect(login_success).to be_nil
      end

      it "should authenticate a user if he enters the right email with additional spaces" do
        login_success = User.authenticate_with_credentials("  test@test.com", "abcde")
        expect(login_success).to be_truthy
      end

      it "should authenticate a user if he enters the right email but with wrong case" do
        @user2 = User.new(first_name: "Bob", last_name: "Roberts", email: "Test@mail.com", password: "password", password_confirmation: "password")
        @user2.save
        login_success = User.authenticate_with_credentials("TEST@MAIL.com", "password")
        expect(login_success).to be_truthy
      end

    end

  end
end
