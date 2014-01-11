class CommentsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @article = Article.find(params[:post_id])
    @comments =@article.comments
    @comment = current_user.comments.new(params[:comment])
    @comment.article = @article
    @comment.save
  end
end
