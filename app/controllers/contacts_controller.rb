class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact created"
      redirect_to messages_path
    else
      render 'new'
    end
  end

private
  def contact_params
    params.require(:contact).permit(:name, :phone_number)
  end

end
