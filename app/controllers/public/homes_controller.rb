class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.includes(:course, :user)
  end

  def about
  end
end
