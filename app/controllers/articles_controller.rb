class ArticlesController < ApplicationController
  before_filter :load_wiki

  def load_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end   

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def new
    @article = Article.new
    authorize! :create, Article, message: "You need to be a member to create a new article."
  end

  def create
    # @article = Article.new(params[:article])
    @article = current_user.articles.build(params[:article])
    @article.wiki = @wiki
    # @article = @wiki.articles.build([:article])
    # @article.user = current_user
    authorize! :create, @article, message: "You need to be signed up to do that."
    if @article.save
      flash[:notice] = "Article was saved."
      redirect_to [@wiki, @article]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
    authorize! :edit, @article, message: "You need to own the article to edit it."
  end

  def update
    @article = Article.find(params[:id])
    authorize! :update, @article, message: "You need to own the article to edit it."
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was updated."
      redirect_to @article
    else
      flash[:notice] = "There was an error saving the article. Please try again."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    name = @article.name
    if @article.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to wiki_articles_path
    else
      flash[:notice] = "There was an error deleting the topic."
      render :show
    end
  end
end