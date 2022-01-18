class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "アカウント作成しました!"
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー情報を編集しました!"
    else
      binding.pry
      render :edit
    end
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:full_name, :name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
