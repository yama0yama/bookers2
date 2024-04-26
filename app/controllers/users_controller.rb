class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book_images  = @user.book_images    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  # 投稿データの保存
  def create
    @user = BookImage.new(book_image_params)
    @user.book_id = current_user.id  
    @user.save
    redirect_to user_path
  end
  
  #データの再新と再新結果の表示先
  def update
    user = User.find(params[:id]) #ユーザーの取得
    user.update(user_params) #ユーザーのアップデート
    redirect_to user_path(user.id)  #ユーザーの詳細ページへのパス
  end

  def index
    @users = User.all
    @user = User.new
  end
  
  # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :book_image)
  end
  
end
