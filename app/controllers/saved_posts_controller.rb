class SavedPostsController < ApplicationController
  def index
    @savedposts = SavedPost.where(user_id: params[:user_id]).paginate(page: params[:page], per_page: 6)
  end
  
  def create
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.save_post!(@blogpost)
    redirect_to root_path, notice: "Added to favourites."
  end
  
  def destroy
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.unsave_post!(@blogpost)
    
    redirect_to root_path, notice: "Removed from favourites."
  end
end
