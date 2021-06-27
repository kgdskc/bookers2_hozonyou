class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      flash[:notice] = "You have updated user successfully."
    else
      redirect_to user_path(current_user.id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @books = @user.books
    @book = Book.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:introduction, :name, :profile_image)
  end
end
