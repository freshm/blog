class SavedPostsController < ApplicationControllers
  def index
  end
  
  def create
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.save_post!(@blogpost)
    
    redirect_to root_path, notice: "Added post to favourites."
  end
  
  def destroy
    @blogpost = BlogPost.find(params[:blogpost_id])
    current_user.unsave_post!(@blogpost)
    
    redirect_to root_path, notice: "Deleted post from favourites."
  end
end
