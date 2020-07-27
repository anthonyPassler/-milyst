class Notifier < ActionMailer::Base
  include Devise::Mailers::Helpers

  # send password reset instructions
  def confirmation_instructions(record)
    devise_mail(record, :confirmation_instructions)
  end

  def reset_password_instructions(record,token,options)
    devise_mail(record, :reset_password_instructions)
  end

  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end
end
