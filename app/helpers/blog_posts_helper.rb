module BlogPostsHelper
  
   def post_by_poster(post)
    User.find(post.user_id).first_name + " " + User.find(post.user_id).last_name
  end
end
