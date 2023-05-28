class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      #flash[:notice] = "You have updated user successfully.."
      redirect_to user_path(@user.id)
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
