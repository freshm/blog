class StaticPagesController < ApplicationController
  def home
  	@blogposts = BlogPost.all
    @blogposts = BlogPost.paginate(page: params[:page])
  end
end
