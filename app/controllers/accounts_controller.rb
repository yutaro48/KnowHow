class AccountsController < ApplicationController

  def index
    @users = User.all

    @histories = current_user.histories.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])

    if @user == current_user
      redirect_to profile_path
    end
  end
end