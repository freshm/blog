class FriendshipsController < ApplicationController
  def index
    @friendships = User.find_by_id(params[:user_id]).friendships
  end
  
  def create
    @friend = User.find(params[:user_id])
    current_user.befriend!(@friend)
    Notifier.friend_request(current_user, @friend).deliver
    
    
    
    redirect_to :back, notice: "Send a friend request to #{@friend.full_name}."
  end
  
  def destroy
    @friend = User.find(params[:user_id])
    current_user.unfriend!(@friend)
    redirect_to :back, notice: "Removed #{@friend.full_name} from your friendlist."
  end
  
  def confirmation
    friendship = Friendship.where(id: params[:friendship_id]).where(confirmation_code: params[:confirmation_code]).first
    reverse_friendship = Friendship.where(other_friend_id: friendship.friend_id).where(friend_id: friendship.other_friend_id).first
    
    unless !friendship == nil
      friendship.confirmed = true
      reverse_friendship.confirmed = true
      friendship.confirmation_code = nil
      reverse_friendship.confirmation_code = nil
            
      friendship.save
      reverse_friendship.save
      
      redirect_to user_friendships_path(current_user), notice: "Confirmed friend!"
    else 
      redirect_to root_path, alert: "Invalid page."
    end
  end
end
