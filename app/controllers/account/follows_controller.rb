class Account::FollowsController < Account::ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:account_id])
    # if @user == current_user
    #   redirect_to profile_path
    # end

    @followings = @user.followings
    @followings = @followings.page(params[:page]).per(6).order(created_at: :desc)
  end
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end