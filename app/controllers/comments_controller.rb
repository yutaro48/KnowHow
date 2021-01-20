class CommentsController < ApplicationController
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

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end