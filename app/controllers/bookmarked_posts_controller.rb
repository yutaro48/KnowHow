class Bookmarked_postsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.bookmarked_posts.order(created_at: :desc)
  end
end