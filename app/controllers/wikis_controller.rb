class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])  
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])  
    authorize @wiki
  end

  def create
     @wiki = current_user.wikis.new(wiki_params)
     authorize @wiki
    
    if @wiki.save
      flash[:success] = "Wiki created!"
      redirect_to wikis_path
    else 
      flash[:error] = "Failed to save"
    end  
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "The wiki was updated"
      redirect_to @wiki
    else
      flash[:error] = "The wiki was not updated"
      render :edit
    end
      
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
