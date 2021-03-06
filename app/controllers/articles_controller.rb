class ArticlesController < ApplicationController
  before_action :set_a, only: [:edit, :update, :show, :destroy]
  
  def index
    @articles =  Article.all
  end
  def new
    @article = Article.new
  end
  
  def create
    
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article deleted successfully"
    redirect_to articles_path
  end
  
  private
    def set_a
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
end