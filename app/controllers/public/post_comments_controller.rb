class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash.now[:notice] = "コメントを投稿しました"
      #jsファイルをrenderする（非同期通信）
      render :post_comments
    else
      render "error"
    end
  end

  def destroy
    #postに紐づいているコメントを削除するため、post_idも必要
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    flash.now[:alert] = 'コメントを削除しました'
    #上記で一度post_idをdestroyしてしまっているため、再度@postを定義
    @post = Post.find(params[:post_id])
    render :post_comments
  end

  private

  def comment_params
    params.require(:post_comment).permit(:comment, :rate)
  end
end
