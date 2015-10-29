class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = current_user.wikis.find(params[:id])  
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = current_user.wikis
  end

  def create
     @wiki = current_user.wikis.new(wiki_params)
    
    if @wiki.save
      flash[:success] = "Wiki created!"
      redirect_to wikis_path
    else 
      flash[:error] = "Failed to save"
    end  
  end

  def update
    @wiki = current_user.wikis.find(params[:id])
  end

  def destroy
    @wiki = current_user.wikis.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
    else
      flash[:error] = "There was an error deleting the Wiki."
    end
     redirect_to wikis_path
  end
    

 
  def wiki_params
   params.require(:wiki).permit(:title, :body)
  end     
end
