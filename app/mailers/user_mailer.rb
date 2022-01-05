class UserMailer < ApplicationMailer

  def notify_user
    @comment = params[:comment]
    @article = params[:article]
    mail(to: @article.user.email, subject: "#{@comment.user.email} commeneted on your article")
  end

  def update_password
    @user = params[:user]
    mail(to: @user.email, subject: "notification")
  end
end
