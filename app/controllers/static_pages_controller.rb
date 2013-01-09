class StaticPagesController < ApplicationController
  helper_method :save_post_for_user
  
  def home
    @blogposts = BlogPost.paginate(page: params[:page], per_page: 7)
  end
  
  def save_post_for_user
    SavedPost.create(Integer(params[:user_id]), Integer(params[:blog_post_id]))
    redirect_to root_path, notice: "Successfully saved entry."
  end
end
