class AuditionsController < ApplicationController
  def index
    @auditions = policy_scope(Audition)
    @auditions = Audition.all
  end

  def show
    @audition = Audition.find(params[:id])
    data = ArtistsMatcherService.new(@audition).call
    data.sort_by! { |user| user[:matching_percentage] }
    authorize @audition
  end

  def new
    @audition = Audition.new
    authorize @audition
  end

  def create
    @audition = Audition.new(audition_params)
    authorize @audition
    if @audition.save
      redirect_to audition_path(@audition), notice: 'Audition was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @audition = Audition.find(params[:id])
    authorize @audition
    @audition.destroy
    redirect_to auditions_path, notice: 'Audition was successfully deleted.'
  end
end
