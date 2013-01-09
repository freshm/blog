class SavedPost < ActiveRecord::Base
  attr_accessible :blog_post_id, :user_id
  
  belongs_to :user
  belongs_to :blog_post
  
  validates :user, presence: :true
  validates :blog_post, presence: :true
end
