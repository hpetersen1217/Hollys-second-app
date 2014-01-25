class WikisController < ApplicationController

  def index
    @wiki = Wiki.all
  end

  def new
    authorize! :create, Wiki
    @wiki = Wiki.new
  end

  def show
    @wiki = Wiki.find(params[:id])
    @articles = @wiki.articles
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wiki
    else
      flash[:error] = "Error creating wiki. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params[:wiki])
      redirect_to @wiki
    else
      flash[:error] = "Error saving wiki. Please try again."
      render :edit
    end
  end
end
  
