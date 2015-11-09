class CollaboratorsController < ApplicationController
  before_action :set_wiki
  
  def index
    @users = User.all
  end
  
  def create   
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new 

   
   if @collaborator.save
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to @wiki_collaborators
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
   end      
  end
  
  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])

   
    if @collaboration.destroy
      flash[:notice] = "Collaborator was removed from this wiki."
      redirect_to @wiki_collaborators
    else
      flash[:error] = "Collaborator was not removed. Please try again."
      render :show
    end     

  end    

  
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end  
end
