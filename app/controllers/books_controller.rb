class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end
  
  # 投稿データの保存
  def create
    @book_image = BookImage.new(book_image_params)
    @book_image.user_id = current_user.id
    if @book_image.save
    redirect_to book_images_path
    else
      @books = Book.all
      render :index
    end
  end

  def edit
  end


  def destroy
  end

  def update
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_image_params
    params.require(:book_image).permit(:book_name, :image, :caption)
  end
  
end
