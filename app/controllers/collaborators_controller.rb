class CollaboratorsController < ApplicationController

  before_action :set_wiki
  
  def index
    @users = User.all
  end
  
  def create  
    @collaborator = @wiki.collaborators.new(user_id: params[:user_id])
   
   if @collaborator.save
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to wiki_collaborators_path(@wiki)
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
   end      
  end
  
  def destroy
   @collaborator = @wiki.collaborators.find(params[:id])

   
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed from this wiki."

    else
      flash[:error] = "Collaborator was not removed. Please try again."
      
    end     
  redirect_to wiki_collaborators_path(@wiki)
  end    

  
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

end
