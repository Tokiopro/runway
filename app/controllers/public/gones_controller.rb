class Public::GonesController < ApplicationController
  before_action :post_params, only: [:create, :destroy]
  
  def create
    Gone.create(user_id: current_user.id, post_id: @post.id)
  end
  
  def destroy
    gone = Gone.find_by(user_id: current_user.id, post_id: @post.id)
    gone.destroy
  end
  
  private
  
  def post_params
    @post = Post.find(params[:post_id])
  end
end
