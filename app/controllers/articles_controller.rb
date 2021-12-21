class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :index

  def index
    @articles = Article.includes(images_attachments: :blob)
  end

  def show; end

  def new
    @article = Article.new
    authorize @article
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
       redirect_to @article, notice: "article is saved"
     else
      render :new, alert: @article.errors.full_messages
    end
    authorize @article
  end

  def update
    if @article.update(article_params)
      redirect_to @article
      authorize @article
     else
      render :edit, alert: @article.errors.full_messages
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    authorize @article
  end

  private

  def set_article
    @article = Article.not_archived.find_by(id: params[:id])
    if @article.nil?
      redirect_to articles_path, alert: "You cannot edit an archived article"
    else
      authorize @article
    end
  end

  def article_params
    params.require(:article).permit( :title, :body, :status, images:[] )
  end
end
