class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation,
                  :hobbies, :gender, :country, :city, :street, :birthday, :image, :confirmed,
                  :confirmation_code

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
    direction = self.friendships.create!(other_friend_id: other_user.id)
    other_direction = other_user.friendships.create!(other_friend_id: self.id)
    other_direction.confirmation_code = SecureRandom.hex(15)
    other_direction.save!
  end
  
  def friends?(other_user)
    !self.friendships.find_by_other_friend_id(other_user.id).nil?
  end
  
  def unfriend!(other_user)
    self.friendships.find_by_other_friend_id(other_user.id).destroy
    other_user.friendships.find_by_other_friend_id(self.id).destroy
  end
  
  def age
    (Time.now.year - birthday.year) - (turned_older? ? 0 : 1) rescue 0
  end
  
  def next_birthday
    bday = Date.new(Date.today.year, birthday.month, birthday.day)
  end
  
  def time_to_next_birthday
    # in days
    bday = Date.new(Date.today.year, birthday.month, birthday.day)
    bday += 1.year if Date.today >= bday
    (bday - Date.today).to_i
    # next_birthday.yday - Time.now.yday rescue 0
  end
  
  def turned_older?
    (birthday.to_time.change(year: Time.now.year) <= Time.now)
  end
end
