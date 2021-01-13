class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    if @user == current_user
      redirect_to profile_path
    end

    @followings = @user.followings
  end
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end