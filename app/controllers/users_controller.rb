class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    @users = User.where(admin: false)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      redirect_to user_path(@user), notice: "Le profil a bien été modifié."
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end
end
