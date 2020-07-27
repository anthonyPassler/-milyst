ActionMailer::Base.smtp_settings = {
  address: 'smtp.postmarkapp.com',
  port: 587,
  domain: 'milyst.xyz',
  user_name: ENV['POSTMARK_API_TOKEN'],
  password: ENV['POSTMARK_API_TOKEN'],
  authentication:       :plain,
  enable_starttls_auto: true
}
