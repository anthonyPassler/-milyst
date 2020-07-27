class Notifier < Devise::Mailer

  # send password reset instructions
  def reset_password_instructions(user)
     @resource = user
     mail(:to => @resource.email, :subject => "Reset password instructions", :tag => 'password-reset', :content_type => "text/html") do |format|
       format.html { render "devise/mailer/reset_password_instructions" }
     end
   end
end
