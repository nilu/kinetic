require 'spec_helper'
require 'rails_helper'

describe ContactsController do 

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.create(:email => 'test@example.com', :password => 'abc123!')
    sign_in @user
    pp current_user
  end

  context 'create' do
    it 'should fail if no email param is given' do
      post :create, :contact => { :user_id => @user.id }
      Contact.all.count.should == 0
    end

    it 'should fail if no user_id param is given' do
      post :create, :contact => { :email => 'test@example.com' }
      Contact.find_by_email('test@example.com').should be_nil
    end

    it 'should fail if user_id does not exist' do
      post :create, :contact => { :email => 'test@example.com', :user_id => 9999 }
    end


    it 'should pass if valid params' do
      post :create, :contact => { :email => 'asdas@asfas.com', :user_id => current_user.id }
      Contact.find_by_email('test@example.com').should_not be_nil
    end
  end
end