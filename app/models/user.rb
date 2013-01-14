class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :blog_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :password, presence: true, on: :create
end
