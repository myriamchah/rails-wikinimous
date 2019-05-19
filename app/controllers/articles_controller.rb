class ArticlesController < ApplicationController
  before_action :set_current_article

  def index
    @articles = Article.all
  end

  def show
    set_current_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def edit
    set_current_article
  end

  def update
    set_current_article
    @article.update(article_params)
    redirect_to articles_path(@article)
  end

  def destroy
    set_current_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_current_article
    if params[:id]
      @article = Article.find(params[:id])
    end
  end
end
