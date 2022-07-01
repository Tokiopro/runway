class Public::UsersController < ApplicationController
  before_action :current_user, only: [:edit, :update, :destroy]
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
    redirect_to user_path, notice: "プロフィールを更新しました"
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(params[:id])
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました"
    redirect_to root_path
  end

  def new_guest
    # emailでユーザーが見つからなければ作ってくれるという便利なメソッド
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
    # 自分はユーザー登録時にニックネームを必須にしているのでこの記述が必要
    user.nickname = "ゲスト"
    # 英数字混合を必須にしているので、ランダムパスワードに、英字と数字を追加してバリデーションに引っかからないようにしています。
    user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
    end
    # sign_inはログイン状態にするデバイスのメソッド、userは3行目の変数userです。
    sign_in user
    # ログイン後root_pathに飛ぶようにしました。
    redirect_to root_path
  end
  private


  def user_params
    params.require(:user).permit(:name, :sex, :introduction, :age, :email, :profile_image)
  end
end
