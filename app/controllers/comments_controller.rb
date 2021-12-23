class CommentsController < ApplicationController
  before_action :find_article
  after_action :verify_authorized

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
    authorize  @comment
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
