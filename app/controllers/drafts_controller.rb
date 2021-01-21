class DraftsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.posts.draft.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(6).order(created_at: :desc)
  end
end