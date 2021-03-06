class Account::AccountsController < Account::ApplicationController

  def index
    @users = User.all
    @users = @users.page(params[:page]).per(6).order(created_at: :desc)

    @histories = current_user.histories
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.published.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(6).order(created_at: :desc)

    if @user == current_user
      redirect_to user_outputs_path
    end
  end
end