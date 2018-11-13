class ContactMailer < ActionMailer::Base
  default to: 'walktrent@gmail.com'
 
  def contact_email(name, email, quote, body)
    @name = name
    @email = email
    @quote = quote
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end