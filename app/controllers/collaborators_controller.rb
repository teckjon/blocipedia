class CollaboratorsController < ApplicationController
  before_action :set_collaborator, only: [:show, :edit, :update, :destroy]
  before_action :set_wiki
  
  def index
    @users = User.all
    @collaborators = @wiki.collaborators
  end
  
  def create  
    @collaborator = Collaborator.new 

   
   if @collaborator.save
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to edit_wiki_path(wiki)
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
   end      
  end
  
  def destroy
    @wiki = current_user.wiki.find(params[:id])
    @collaborator = wiki.collaborator.find(params[:id])

   
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
      redirect_to edit_wiki_path(wiki)
    else
      flash[:error] = "Collaborator was not removed. Please try again."
      redirect_to edit_wiki_path(wiki)
    end     

  end    

  
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end  
end
