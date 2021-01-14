class OutputsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.published.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5).order(created_at: :desc)
  end
end