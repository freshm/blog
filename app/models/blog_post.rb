class BlogPost < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :saved_posts
  has_many :users, through: :saved_post, dependent: :destroy
  
  validates :title, presence: true, length: {maximum: 60}
  validates :user_id, presence: true
  
  default_scope order: 'blog_posts.created_at DESC'
end
