class ArticlesController < ApplicationController
  def new # 定義 for views/articles/new.html.erb
    @article = Article.new
  end

  def create
    # render plain: params[:a rticle].inspect # 觀察資料
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    # find by article id(number)
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end