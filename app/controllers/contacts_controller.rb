class ContactsController < ApplicationController
  def create
    pp "@"*60
    pp contact_params
    Contact.create(contact_params)
    pp '1'*60
    pp Contact.all
    flash[:notice] = 'Boom! New Contact Added'
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :user_id)
  end
end
