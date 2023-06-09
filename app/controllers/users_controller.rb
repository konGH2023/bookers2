class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
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
    if @user.update(user_params)
      #flash[:notice] = "You have updated user successfully.."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
