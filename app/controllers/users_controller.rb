class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: [:search]

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


  def search
    if params[:query].present?
      @users = User.where("first_name ILIKE :query OR last_name ILIKE :query", query: "%#{params[:query]}%")
    else
      @users = User.not_admin
    end

    render json: {
      text: render_to_string(partial: "components/cards", locals: { users: @users }, formats: :html),
    }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo, :portfolio, :phone_number, :languages, :social_link, :address, :city, :birth_date, :pola_3_4, :pola_mains, :pola_silhouette)
  end
end
