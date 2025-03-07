class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
  
    def index
      @articles = Article.all
    end
  
    def new
      @article = Article.new
    end
  
    def create
      @article = Article.new(article_params)
  
      if @article.save
        redirect_to @article, notice: 'Article is successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article is successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article is successfully destroyed.'
    end
  
    private
  
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :content, :author, :date)
    end
  end
