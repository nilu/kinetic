class ContactsController < ApplicationController
  def index
  end

  def create
    Contact.create(contact_params)
    flash[:notice] = 'Boom! New Contact Added'
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :user_id)
  end
end
