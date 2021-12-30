class CommentsController < ApplicationController
  before_action :find_article

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    authorize  @comment

    if @comment.save
      UserMailer.with(comment: @comment, article: @article).notify_user.deliver_later
      redirect_to article_path(@article)
    else
      redirect_to @article, alert: @comment.errors.full_messages.to_sentence
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
