class BlogPostsController < ApplicationController
  before_filter :have_permission
  
  def new
    @blogpost = BlogPost.new
  end
  
  def create
    @blogpost = current_user.blog_posts.build(params[:blog_post])
    if @blogpost.save
      redirect_to root_path, notice: "Created entry."
    else
      render "new"
    end
  end
  
  def show
    @blogpost = BlogPost.find(params[:id])
  end
  
  def destroy
    BlogPost.find(params[:id]).destroy
    flash[:notice] = "Entry deleted."
    redirect_to root_path
  end
  
  def edit
    @blogpost = BlogPost.find(params[:id])
  end
  
  def update
    @blogpost = BlogPost.find(params[:id])
    if @blogpost.update_attributes(params[:blog_post])
      flash[:notice] = "Entry successfully edited."
      redirect_to root_path
    else
      render "edit"
    end
  end
  
  private
  
  def have_permission
    redirect_to root_url unless current_user.admin?
  end
end
