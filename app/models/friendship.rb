class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :other_friend_id
  
  belongs_to :friend, class_name: "User"
  belongs_to :other_friend, class_name: "User"
end
