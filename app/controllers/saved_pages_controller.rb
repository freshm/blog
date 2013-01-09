class SavedPagesController < ApplicationController
  
  def new
    
  end
  
  def create
    
    redirect_to root_path, notice: "Successfully saved entry."
  end
  
  def destroy
    
  end
end
