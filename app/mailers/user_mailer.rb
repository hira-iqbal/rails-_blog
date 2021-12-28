class UserMailer < ApplicationMailer

  default from: 'hirach502@gmail.com'
  def notify_user
    @comment = params[:comment]
    @user = params[:user]
    @commenter_user = params[:commenter_user]
    mail(to: @user.email, subject: 'Someone commented on your article.')
  end
end
