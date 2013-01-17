module FriendshipsHelper
  def friend(friendship)
    User.find_by_id(friendship.other_friend_id)
  end
end
