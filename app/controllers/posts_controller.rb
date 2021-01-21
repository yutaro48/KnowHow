class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!

  def index
    @posts = Post.published.order(created_at: :desc)
    @posts = Post.published.search(params["q"]).order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(6).order(created_at: :desc)

    @histories = current_user.histories
  end

  def show
    @comments = @post.comments.order(created_at: :desc)

    post = Post.find(params[:id])
    new_history = post.histories.new
    new_history.user_id = current_user.id
    if current_user.histories.exists?(post_id: "#{params[:id]}")
      old_history = current_user.histories.find_by(post_id: "#{params[:id]}")
      old_history.destroy
    end
    new_history.save

    histories_stock_limit = 6
    histories = current_user.histories.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end
    @histories = current_user.histories
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if @post.has_published?
        redirect_to post_path(@post), notice: 'アウトプットしました。'
      else
        redirect_to drafts_path, notice: '下書きに保存しました。'
      end
    else
      flash.now[:error] = 'アウトプットできませんでした。'
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      if @post.has_published?
        redirect_to post_path(@post), notice: '更新しました。'
      else
        redirect_to drafts_path, notice: '下書きに保存しました。'
      end
    else
      flash.now[:error] = '更新できませんでした。'
      render :edit
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to root_path, notice: 'ノウハウを削除しました。'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :status, :category)
  end

end