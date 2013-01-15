class UsersController < ApplicationController
  before_filter :signed_in_user, only: [ :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :correct_user_for_profile, only: :show
  before_filter :is_admin, only: :index
  
  
  def index
    @users = User.paginate(page: params[:page], per_page: 12)
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.paginate(page: params[:page], per_page: 7)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if verify_recaptcha(message: "You typed in the wrong captcha!") && @user.save
      Notifier.signed_up(@user).deliver
      
      redirect_to root_url, notice: "Signed up!"
    else
      flash.delete(:recaptcha_error)
      render "new"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render "edit"
    end
  end
  
  private

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def correct_user_for_profile
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user) || current_user.admin?
  end
  
  def is_admin
    redirect_to(root_path) unless current_user.admin?
  end
end
