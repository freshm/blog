class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :blog_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_posts
  has_many :blog_posts, through: :saved_posts
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :password, presence: true, on: :create
  
  def save_post!(post)
    saved_posts.create(blog_post_id: post.id)
  end
  
  def saved_post?(post)
    saved_posts.find_by_blog_post_id(post.id)
  end
  
  def unsave_post!(post)
    saved_posts.find_by_blog_post_id(post.id).destroy
  end
end
