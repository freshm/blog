module SavedPostsHelper
  def post(saved_post)
    BlogPost.find_by_id(saved_post.blog_post_id)
  end
  
  def post_name(saved_post)
    BlogPost.find_by_id(saved_post.blog_post_id).title
  end
  
  def post_content(saved_post)
    BlogPost.find_by_id(saved_post.blog_post_id).content
  end
end
