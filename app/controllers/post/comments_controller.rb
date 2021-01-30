class Post::CommentsController < Post::ApplicationController
  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build

    @histories = current_user.histories
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(post), notice: 'コメントを追加しました。'
    else
      flash.now[:error] = '更新できませんでした。'
      render :new
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(post), notice: '更新しました。'
    else
      flash.now[:error] = '更新できませんでした。'
      render :edit
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end