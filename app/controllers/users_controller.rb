class UsersController < ApplicationController
  #deviceのヘルパーindexアクション以外のアクセスを制限
  before_action :authenticate_user!, except: [:index]
  
  def index
    #Userモデルからユーザーの情報をすべて持ってくる
    #@usersというグローバル変数に代入
    @users = User.all
    #複数形にするのがルール
  end

  def show
    #controllerのactionで変数定義してviewに渡す
    @user = User.find(params[:id])
    @neta = Neta.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  #コントローラーの中でしか動かせないように
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end
