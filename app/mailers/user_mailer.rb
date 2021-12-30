class UserMailer < ApplicationMailer

  def notify_user
    @comment = params[:comment]
    @article = params[:article]
    mail(to: @article.user.email, subject: "#{@comment.user.email} commeneted on your article")
  end
end
