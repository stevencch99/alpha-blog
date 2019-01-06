class ArticlesController < ApplicationController

  def index
    # grab all the articles from database
    @articles = Article.all
  end

  def new # define this method for views/articles/new.html.erb to use
    # and this method is handled by create method
    @article = Article.new
  end

  def edit # this method is handled by update method
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:a rticle].inspect # 觀察資料
    @article = Article.new(article_params) # pass in params from new method
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params) # pass in params from edit method
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    # find by article id(number)
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

end