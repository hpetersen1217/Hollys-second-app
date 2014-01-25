class CollaborationsController < ApplicationController
  def show
    @wiki = Wiki.find(params[:wiki_id])
    # current collaborators with collaboration destroy buttons
    # everybody else with collaboration create buttons
  end

  def create
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    if Collaboration.exists?(user_id: current_user.id, wiki_id: @wiki.id)
      # authorize! :manage, @wiki, message: "You need to be assigned to collaborate on this wiki."
      Collaboration.create(user_id: @user.id, wiki_id: @wiki.id)
      flash[:notice] = "Congratulations, you've been assigned to collaborate on this wiki!"
      redirect_to @wiki
    else
      flash[:error] = "You need permissions"
      redirect_to @wiki
    end
  end

  def destroy
    c = Collaboration.where(user_id: params[:user_id], wiki_id: params[:wiki_id]).first
    c.destroy
    flash[:notice] = "You are no longer a collaborator on this wiki."
    redirect_to root_path
  end
end






