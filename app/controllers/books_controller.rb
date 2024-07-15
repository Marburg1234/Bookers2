class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    # @user = User.find(params[:id])
    @user = @book.user
    #@users = @book.user
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def update
  end

  def destroy
  end


  private
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
