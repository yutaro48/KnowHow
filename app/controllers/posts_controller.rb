class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
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
  end

  def update
    if @post.update(post_params)
        redirect_to post_path(@post), notice: '更新しました。'
    else
        flash.now[:error] = '更新できませんでした。'
        render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path, notice: 'ノウハウを削除しました。'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end