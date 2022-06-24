class Public::GosController < ApplicationController
  before_action :post_params, only: [:create, :destroy]

  def create
    Go.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    go = Go.find_by(user_id: current_user.id, post_id: @post.id)
    go.destroy
  end

  private

  def post_params
    @post = Post.find(params[:post_id])
  end
end
