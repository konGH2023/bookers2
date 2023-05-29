class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = @user.books

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
      #flash[:notice] = "You have updated user successfully.."
      redirect_to user_path(@user.id)
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
