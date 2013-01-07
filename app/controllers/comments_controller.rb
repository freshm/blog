class CommentsController < ApplicationController
  def new
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = @blogpost.comments.build
  end

  def create
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = @blogpost.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @blogpost, notice: "Successfully created comment."
    else
      render 'new'
    end
  end

  def show
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = @blogpost.comments.find(params[:id])
  end

  def destroy
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = Comment.find(params[:id]).destroy
    flash[:notice] = "Comment deleted."
    redirect_to @blogpost
  end

  def edit
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = @blogpost.comments.find(params[:id])
  end

  def update
    @blogpost = BlogPost.find(params[:blog_post_id])
    @comment = @blogpost.comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to @blogpost, notice: 'Comment was successfully updated.'
    else
      render 'edit'
    end
  end
end
