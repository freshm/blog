class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def post_by_poster(post)
    User.find(post.user_id).first_name
  end
end
