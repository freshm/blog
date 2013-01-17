class FriendshipsController < ApplicationController
  def index
    @friendships = User.find_by_id(params[:user_id]).friendships
  end
  
  def create
    @friend = User.find(params[:user_id])
    current_user.befriend!(@friend)
    redirect_to :back, notice: "Added #{@friend.full_name} to your friendlist."
  end
  
  def destroy
    @friend = User.find(params[:user_id])
    current_user.unfriend!(@friend)
    redirect_to :back, notice: "Removed #{@friend.full_name} from your friendlist."
  end
end
