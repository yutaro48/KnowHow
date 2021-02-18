class Post::TimelinesController < Post::ApplicationController
  def show
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids).published.order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(6).order(created_at: :desc)

    @histories = current_user.histories
  end
end