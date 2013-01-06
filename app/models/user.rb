class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :blog_posts, dependent: :destroy
  
  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true, length: {maximum: 30}
  validates :password, presence: true, on: :create
end
