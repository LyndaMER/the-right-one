class ArtistsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def index
    @audition = Audition.find(params[:audition_id])
    @artists = ArtistsMatcherService.new(@audition).call.uniq
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(artist_params)
    if @user.save!
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @artist = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @artist = User.find(params[:id])
    @artist.update(artist_params)

    redirect_to user_path(@artist)
  end

  def destroy
    @artist = User.find(params[:id])
    @artist.destroy
    redirect_to users_path, notice: "Le profil de l'artiste a été supprimé avec succès."
  end

  private

  def artist_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :address, :phone_number, :birth_date, :pola_face, :portfolio, :social_link)
  end

end
