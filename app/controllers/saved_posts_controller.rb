class SavedPostsController < ApplicationController
  def index
    @savedposts = SavedPost.where(params[:user_id])
  end
  
  def create
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.save_post!(@blogpost)
    redirect_to root_path, notice: "Removed from favourites."
  end
  
  def destroy
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.unsave_post!(@blogpost)
    
    redirect_to root_path, notice: "Removed from favourites."
  end
end
