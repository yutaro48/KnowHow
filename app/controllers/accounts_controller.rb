class AccountsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    if @user == current_user
      redirect_to profile_path
    end
  end
end