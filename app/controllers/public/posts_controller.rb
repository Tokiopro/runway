class Public::PostsController < ApplicationController
  before_action :ensure_user, only: [:edit, :uodate, :destroy]
  
  def new
    @post = Post.new
    @post.build_course
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new', notice: "投稿できませんでした"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render edit_post_path(@post.id), notice: "更新できませんでした"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:article, :image, course_attributes: [:name, :prefecutures, :undulation, :traffic_light, :street_light])
  end
  
  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to post_path(@post.id) unless @post
  end
end
