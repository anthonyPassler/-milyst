class UserMailer < ApplicationMailer
  def list_send(list, user)
    @list = list
    @user = user
    mail(to: @user.email, subject: "Your Shopping List")
  end
end
