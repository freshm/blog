class StaticPagesController < ApplicationController
  def home
    @blogposts = BlogPost.all
  end
end
