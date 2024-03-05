class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @users = User.all
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
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path, notice: 'User was successfully deleted.'
  end
end
