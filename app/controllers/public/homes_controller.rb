class Public::HomesController < ApplicationController
  def top
    @posts = Post.with_attached_image.includes(:course, :user)
  end

  # def self.search(keyword)
  #   where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  # end

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model =='prefecutures'
      @records = Course.prefecutures.search_for(@content, @method)
    else
      @records = Course.name.search_for(@content, @method)
    end
  end


  def about
  end
end
