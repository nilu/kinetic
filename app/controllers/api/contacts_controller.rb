module Api
  class ContactsController < Api::BaseController

    def index
      user = User.find_by_id(params[:user_id])
      if user.nil?
        render :json => { :error => "User with id #{params[:user_id]} does not exist" }
      else
        render :json => user.contacts
      end
    end

  end
end