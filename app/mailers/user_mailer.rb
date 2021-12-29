class UserMailer < ApplicationMailer

  def notify_user
    @comment = params[:comment]
    @article = params[:article]
    @user = params[:user]
    @commenter_user = params[:commenter_user]
    mail(to: @user.email, subject: "#{@commenter_user.email} commeneted on your article")
  end
end
