class ArticlesController < ApplicationController
  
  before_filter :authorize, only: [:new]
  def index
	 @articles = Article.order(updated_at: :desc).limit(25)
  end
  
  before_filter :authorize, only: [:new]
  def show
    @article = Article.find(params[:id])
  end

  before_filter :authorize, only: [:new]
  def new
    @article = Article.new
  end

  before_filter :authorize, only: [:new]
  def create
    @article = Article.new(article_params)
      if @article.save
        redirect_to @article, notice: 'Your article has been published!'
      else
        render "new"
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_ids => [])
    end
end
