class ArtistsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  before_action :artist_params, only: [:create, :edit]

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
      if params[:required_tags].present?
        params[:required_tags][:name].each_with_index do |tag_name, index|
          value = params[:required_tags][:value][index.to_i]
          next if value.blank?
          tag = Tag.find_or_create_by(name: tag_name, value: value.downcase)
          UserTag.create(user: @user, tag: tag, required: false)
        end
      end

      if params[:optional_tags].present?
        params[:optional_tags][:name].each_with_index do |tag_name, index|
          value = params[:optional_tags][:value][index.to_i]
          next if value.blank?
          tag = Tag.find_or_create_by(name: tag_name, value: value.downcase)
          UserTag.create(user: @user, tag: tag, required: false)
        end
      end

      redirect_to user_path(@user), notice: "L'artiste a bien été modifiée."
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
    params.require(:user).permit(:first_name, :last_name, :email, :password, :address, :phone_number, :birth_date, :pola_face, :portfolio, :social_link, :required_tags, :pola_3_4, :pola_mains, :pola_silhouette,:presentation_video)
  end

end
