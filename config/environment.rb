# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  domain: 'https://streetreport.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true,
  user_name: ENV["SGUSER_NAME"],
  password: ENV["SGPASSWORD"]
}
# Initialize the Rails application.
Rails.application.initialize!
