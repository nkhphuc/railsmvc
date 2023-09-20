# frozen_string_literal: true

# Application Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'nkhphuc@gmail.com'
  layout 'mailer'
end
