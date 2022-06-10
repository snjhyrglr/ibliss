# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
  address:               "smtp.mail.yahoo.com",
  port:                  587,
  domain:                "yahoo.com",
  user_name:             "sonjhay19@ymail.com",
  password:              "Yangyang18!",
  authentication:        "plain",
  :ssl                  => true,
  :tsl                  => true,
  enable_starttls_auto: true
}