class CommentsController < ApplicationController
  before_action :find_article
  after_action :verify_authorized

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
     UserMailer.with(user: @article.user, comment: @comment, commenter_user: @comment.user, article: @article).notify_user.deliver_later
     redirect_to article_path(@article)
     authorize  @comment
  end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    authorize  @comment
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status, images:[])
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
