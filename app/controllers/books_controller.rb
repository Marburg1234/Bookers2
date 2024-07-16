class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
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
    unless current_user.id == @book.user.id
      redirect_to book_path(@book.id)
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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
