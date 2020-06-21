class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_article, only: %i(edit update destroy)

  def index
    @articles = Article.all.order(:created_at)
  end

  def new
    @article = current_user.articles.build
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
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
