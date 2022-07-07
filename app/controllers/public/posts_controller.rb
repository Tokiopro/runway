class Public::PostsController < ApplicationController
  before_action :ensure_user, only: [:edit, :uodate, :destroy]

  def new
    #PostForm = フォームオブジェクト(app/form/post_form.rb)
    @post = PostForm.new
  end

  def create
    @post = PostForm.new(post_params)

    if @post.save
      redirect_to post_path(@post.post_id), notice: "投稿に成功しました!"
    else
      render 'new', notice: "投稿できませんでした"
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_form = PostForm.import(params[:id])
    @comment = PostComment.new
  end

  def edit
    @post = PostForm.import(params[:id])
  end

  def update
    @post = PostForm.new(post_params)
    if @post.save
      redirect_to post_path(@post.post_id), notice: "投稿情報を更新しました！"
    else
      render edit_post_path(@post.post_id), notice: "更新できませんでした"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end

  # def tag
  #   @user = current_user
  #   @tag = Tag.find_by(name: params[:name])
  #   # @post = PostForm.import(params[:id])
  # end

  def tag
    @user = current_user
    if params[:hashname].nil?
      @tags = Tag.all.to_a.group_by{ |tag| tag.posts.count}
    else
      @tag = Tag.find_by(hashname: params[:hashname])
      @post = @tag.post.page(params[:page]).per(20).reverse_order
      @tags = Tag.all.to_a.group_by{ |tag| tag.posts.count}
    end
  end

  private

  def post_params
    params.require(:post_form).permit(:post_id,
                                      :article,
                                      :hashbody,
                                      :image,
                                      :distance,
                                      :name,
                                      :prefecutures,
                                      :undulation,
                                      :traffic_light,
                                      :street_light,
                                      :hashname,
                                      type: {},
                                      time_zone: {},
                                      equipment: {},
                                      method: {}).merge(user_id: current_user.id)
  end

  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to post_path(@post.id) unless @post
  end


end