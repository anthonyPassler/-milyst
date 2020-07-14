class UserMailer < ApplicationMailer
  def list_send(list, user, email)
    @list = list
    @user = user
    @email = email
    mail(to: @email, subject: "Your Shopping List")
  end
end
