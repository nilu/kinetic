class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    pp '@'*60

  end

  def update
    User.create(contact_params)
    flash[:notice] = 'Boom! New Contact Added'
    redirect_to root_path
  end

end
