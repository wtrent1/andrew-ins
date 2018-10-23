class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = "Message sent."
      redirect_to root_path
    else
      flash[:danger] = @contact.errors.full_messages.join(",")
      redirect_to contact_me_path
    end
  end
  
  # To collect data from form, strong parameters were used and form fields were
  # whitelisted
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end