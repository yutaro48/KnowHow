class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    if @user == current_user
      redirect_to profile_path
    end

    @follows = @user.following_relationships
  end
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end