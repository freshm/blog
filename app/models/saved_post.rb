class SavedPost < ActiveRecord::Base
  attr_accessible :blog_post_id, :user_id
  
  belongs_to :user
  belongs_to :blog_post
  
  validates_uniqueness_of :user_id, scope: :blog_post_id
  validates :blog_post_id, presence: true
  validates :user_id, presence: true
end
