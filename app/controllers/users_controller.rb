class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    pp "!"*60
  end

end
