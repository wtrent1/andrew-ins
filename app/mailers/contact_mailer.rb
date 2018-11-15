class ContactMailer < ActionMailer::Base
  default to: 'andrew@tjohnsonins.com'
 
  def contact_email(name, email, coverage, body)
    @name = name
    @email = email
    @coverage = coverage
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end