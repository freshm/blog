class StaticPagesController < ApplicationController
  def home
    @blogposts = BlogPost.paginate(page: params[:page], per_page: 7)
  end
end
