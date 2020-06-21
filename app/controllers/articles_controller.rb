class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_article, only: %i(edit update)

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
  end

  def destroy
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
