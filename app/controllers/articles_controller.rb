class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all 
  end

  def create
    @article = Article.new articles_params

    if @article.save 
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def set_article
    @article = Article.find params[:id]
  end

  def articles_params
    params.require(:article).permit :title, :text
  end
end
