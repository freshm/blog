class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :blog_post
  belongs_to :user
  
  validates :content, presence: true
  validates :user_id, presence: true
  validates :blog_post_id, presence: true
end
