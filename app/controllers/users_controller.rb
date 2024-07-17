class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    # フラッシュメッセージを挿入する
    if @user.update (user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @users = User.all
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
