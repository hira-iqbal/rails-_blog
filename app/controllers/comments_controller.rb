class CommentsController < ApplicationController
  http_basic_authenticate_with name: "adha", password: "security", only: [:destroy]
  before_action :find_article
  before_action :verify_authorized

  def create
    @comment = @article.comments.create(comment_params)
    authorize  @comment
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    authorize  @comment
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def find_article
    @article = Article.find(params[:article_id])

  end
end
