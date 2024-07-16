class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
    @user = @book.user
    #@users = @book.user
  end

  def index
    @user = User.find(current_user.id)
    #投稿した人の画像を表示できるようにしたい
    @book = Book.new
    @books = Book.all
    # @users = @books.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
