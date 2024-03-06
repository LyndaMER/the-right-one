class ArtistsController < ApplicationController

  def index
    @audition = Audition.find(params[:audition_id])
    @artists = ArtistsMatcherService.new(@audition).call
    @artists = policy_scope(Artist)
    autorize @artist
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist
  end
end
