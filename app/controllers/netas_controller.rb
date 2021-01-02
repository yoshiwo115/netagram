class NetasController < ApplicationController
  #deviceのヘルパーindexアクション以外のアクセスを制限
  before_action :authenticate_user!, except: [:index]
  
  def index
    @netas = Neta.all.order(id: "DESC")
  end

  def show
    @neta = Neta.find(params[:id])
  end

  def new
    @neta = Neta.new
  end

  def create
    @neta = current_user.netas.build(neta_params)
    if @neta.save
      redirect_to neta_path(@neta), notice: "ネタを投稿しました。"
    else
      #action(controller)を介さずにnewへ
      render :new
    end
  end

  def edit
    @neta = Neta.find(params[:id])
    if @neta.user != current_user
        redirect_to netas_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @neta = Neta.find(params[:id])
    if @neta.update(neta_params)
      redirect_to neta_path(@neta), notice: "ネタを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    neta = Neta.find(params[:id])
    neta.destroy
    redirect_to user_path(neta.user), notice: "ネタを削除しました。"
  end

  private
  def neta_params
    params.require(:neta).permit(:title, :body, :image)
  end
end
