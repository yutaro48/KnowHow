class Post::BookmarksController < Post::ApplicationController
  def show
    post = Post.find(params[:post_id])
    bookmark_status = current_user.has_bookmarked?(post)
    render json: { hasBookmarked: bookmark_status }
  end

  def create
    post = Post.find(params[:post_id])
    post.bookmarks.create!(user_id: current_user.id)
    render json: { status: 'ok' }
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = post.bookmarks.find_by!(user_id: current_user.id)
    bookmark.destroy!
    render json: { status: 'ok' }
  end
end