class Public::PostsController < ApplicationController
  def new
    @post = Post.new
    @post.build_course
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
#    binding.pry
    if @post.save!
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
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:article, :image, course_attributes: [:name, :prefecutures])
    #params.require(:course).permit(:name, :start_latitude, :start_longitude, :end_latitude, :end_longitude, 
                                  #:distance, :prefecutures, :undulation, :traffic_light, :street_light)
    #params.require(:course_type).permit(:type)#コースタイプ
    #params.require(:course_time_zone).permit(:time_zone)#おすすめの時間帯
    #params.require(:course_method).permit(:method)#コースの走り方
    #params.require(:course_equipment).permit(:equipment)#コースの設備
  end
end
