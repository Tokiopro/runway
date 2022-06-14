class Public::UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to users_path
  end
  
  def withdrawal
    @user = User.find(params[:id])
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました"
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :sex, :introduction, :age, :email)
  end
end
