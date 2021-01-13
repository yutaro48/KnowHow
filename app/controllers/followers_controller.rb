class FollowersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])

    if @user == current_user
      redirect_to profile_path
    end

    @followers = @user.followers
  end
end