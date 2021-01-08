class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.bookmarks.create!(user_id: current_user.id)
    redirect_to post_path(post)
  end
end