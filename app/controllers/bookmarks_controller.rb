class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def show
    post = Post.find(params[:post_id])
    bookmark_status = current_user.has_bookmarked?(post)
    render json: { hasBookmarmed: bookmark_status }
  end

  def create
    post = Post.find(params[:post_id])
    post.bookmarks.create!(user_id: current_user.id)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = post.bookmarks.find_by!(user_id: current_user.id)
    bookmark.destroy!
    redirect_to post_path(post)
  end
end