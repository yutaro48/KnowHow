class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    if @user == current_user
      redirect_to profile_path
    end

    user_ids = @user.followings.pluck(:id)
    @followings = Profile.where(user_id: user_ids)
  end
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end