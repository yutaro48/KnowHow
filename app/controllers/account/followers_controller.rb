class Account::FollowersController < Account::ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])

    # if @user == current_user
    #   redirect_to profile_path
    # end

    @followers = @user.followers
    @followers = @followers.page(params[:page]).per(6).order(created_at: :desc)
  end
end