class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.ordered
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "article is saved"
     else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.archived.find_by(id: params[:id])
    if @article.nil?
      redirect_to articles_path, alert: "You cannot edit a public or a private article"
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
