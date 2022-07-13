class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!, except: [:top]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :sex, :introduction, :age, :email, :profile_image)
  end
end
