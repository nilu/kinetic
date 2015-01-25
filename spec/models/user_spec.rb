require 'spec_helper'
require 'rails_helper'

describe User do 
  context 'create' do
    it 'should fail if no email is given' do
      User.all.count.should == 0
      user = User.new(:password => 'abc123!')
      expect{ user.save! }.to raise_error, "Email can't be blank"
      User.all.count.should == 0
    end

    it 'should fail if email is not unique' do
      user = User.create(:email => 'test@example.com', :password => 'abc123!')
      user.save!
      User.all.count.should == 1

      other_user = User.create(:email => 'test@example.com', :password => 'zxy321!')
      expect { other_user.save! }.to raise_error, "Email is not unique"
      User.all.count.should == 1
    end

    it 'should fail if no password is given' do
      user = User.new(:email => 'test@example.com')
      expect { user.save! }.to raise_error, "Password can't be blank"
      User.find_by_email('test@example.com').should be_nil
    end

    it 'should fail if password is not long enough' do
      user = User.new(:email => 'test@example.com', :password => '123')
      expect { user.save! }.to raise_error, "Password is too short (minimum is 6 characters)"
      User.find_by_email('test@example.com').should be_nil 
    end 

    it 'should pass if email and password are valid' do
      user = User.new(:email => 'test@example.com', :password => 'zxy321!')
      expect { user.save! }.to_not raise_error
      User.find_by_email('test@example.com').should_not be_nil
    end
  end

  context 'update' do
    before :each do
      @user = User.create(:email => 'test@example.com', :password => 'abc123!')
    end

    it 'should fail if email is blank' do
      @user.update_attributes(:email => '')
      expect { @user.save! }.to raise_error, "Email can't be blank"
      User.find_by_email('test@example.com').should_not be_nil
      User.find_by_email(nil).should be_nil
    end

    it 'should fail if password is blank' do
      @user.update_attributes(:password => '')
      expect { @user.save! }.to raise_error, "Password can't be blank"
    end

    it 'should fail if password is too short' do
      @user.update_attributes(:password => 'short')
      expect { @user.save! }.to raise_error, "Password is too short (minimum is 6 characters)"
    end

    it 'should pass if email and password are valid' do
      @user.update_attributes(:email => 'other_email@example.com', :password => 'alongenoughpassword')
      expect { @user.save! }.to_not raise_error
      @user.reload
      User.find_by_email('other_email@example.com').should_not be_nil
    end
  end

  context 'delete' do
    before :each do
      @user = User.create(:email => 'test@example.com', :password => 'abc123!')
    end

    it 'should delete' do
      @user.delete
      User.find_by_email('test@example.com').should be_nil
    end
  end

end