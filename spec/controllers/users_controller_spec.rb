require 'spec_helper'
require 'rails_helper'

describe UsersController do 

  before :each do
    @user = User.create(:email => 'test@example.com', :password => 'abc123!')
  end

  context 'index' do
    it 'should redirect to sign_in page if you are not signed in' do
      get :index 
      response.should redirect_to new_user_session_path
    end
  end
end