class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contact_me_path, notice: "Message sent."
    else
      redirect_to contact_me_path, notice: "Error occured."
    end
  end
  
  # To collect data from form, strong parameters were used and form fields were
  # whitelisted
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end