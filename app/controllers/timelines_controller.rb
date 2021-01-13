class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids).order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5).order(created_at: :desc)
  end
end