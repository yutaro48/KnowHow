class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_user!
  # , only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.published.order(created_at: :desc)
    @posts = Post.published.search(params["q"]).order(created_at: :desc)
    @posts = @posts.page(params[:page]).per(5).order(created_at: :desc)
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: 'アウトプットしました。'
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
      redirect_to post_path(@post), notice: '更新しました。'
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