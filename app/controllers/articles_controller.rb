class ArticlesController < ApplicationController
  # before_action makes redundant code cleaned
  # define a private function set_article in order to do so - 190106
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    # grab all the articles from database
    @articles = Article.all
  end

  def new # define this method for views/articles/new.html.erb to use
    # and this method is handled by create method
    @article = Article.new
  end

  def edit # this method is handled by update method

  end

  def create
    # render plain: params[:a rticle].inspect # 觀察資料
    @article = Article.new(article_params) # pass in params from new method
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update

    if @article.update(article_params) # pass in params from edit method
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    # find by article id(number)

  end

  def destroy

    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
