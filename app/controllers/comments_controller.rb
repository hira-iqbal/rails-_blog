class CommentsController < ApplicationController
  http_basic_authenticate_with name: "adha", password: "security", only: [:destroy]
  before_action :find_article
  after_action :verify_authorized

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
    authorize  @comment
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    authorize  @comment
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status, image_attributes: [:id, :image])
  end

  def find_article
    @article = Article.find(params[:article_id], images_attributes: [:id, :image])

  end
end
