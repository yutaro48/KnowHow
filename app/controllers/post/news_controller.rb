class Post::NewsController < Post::ApplicationController
    before_action :authenticate_user!
  
    def index
      @posts = Post.published.news.order(created_at: :desc)
      @posts = @posts.page(params[:page]).per(6).order(created_at: :desc)
  
      @histories = current_user.histories
    end
  end