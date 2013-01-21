class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation,
                  :hobbies, :gender, :country, :city, :street, :age, :image

  has_many :blog_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :saved_posts, dependent: :destroy
  has_many :blog_posts, through: :saved_posts
  has_many :friendships, foreign_key: "friend_id", dependent: :destroy
  has_many :other_friends, through: :friendships, source: :other_friend
  has_many :reverse_friendships, foreign_key: "other_friend_id",
                                   class_name: "Friendship",
                                   dependent: :destroy
  has_many :friends, through: :reverse_friendships, source: :friend

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :password, presence: true, on: :create
  validates :age, inclusion: { in: 1..120, message: "must be between 1 and 120." }, allow_nil: true, :on => :update
  
  
  mount_uploader :image, ImageUploader
  
  def save_post!(post)
    self.saved_posts.create(blog_post_id: post.id)
  end

  def saved_post?(post)
    self.saved_posts.find_by_blog_post_id(post.id)
  end

  def unsave_post!(post)
    self.saved_posts.find_by_blog_post_id(post.id).destroy
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def delete_image(user)
    user.image.destroy!
  end
  
  def befriend!(other_user)
    self.friendships.create!(other_friend_id: other_user.id)
    other_user.friendships.create!(other_friend_id: self.id)
  end
  
  def friends?(other_user)
    self.friendships.find_by_other_friend_id(other_user.id).nil?
  end
  
  def unfriend!(other_user)
    self.friendships.find_by_other_friend_id(other_user.id).destroy
    other_user.friendships.find_by_other_friend_id(self.id).destroy
  end
end
