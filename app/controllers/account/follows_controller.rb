class Account::FollowsController < Account::ApplicationController
  def index
    @user = User.find(params[:account_id])
    @followings = @user.followings
    @followings = @followings.page(params[:page]).per(6).order(created_at: :desc)
  end
  
  def create
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end