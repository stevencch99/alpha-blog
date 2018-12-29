class ArticlesController < ApplicationController
  def new # 定義 for views/articles/new.html.erb
    @article = Article.new
  end

  def create
    # render plain: params[:a rticle].inspect # 觀察資料
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end