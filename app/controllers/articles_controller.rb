class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(index, show)
  before_action :set_article, only: %i(show edit update destroy)

  def index
    @articles = Article.all.order(:created_at)
  end

  def new
    @article = current_user.articles.build
  end

  def show
  end

  def edit
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_url
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to articles_url
    else
      render :new
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_url
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
