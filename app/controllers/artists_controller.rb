class ArtistsController < ApplicationController

  def index
    @audition = Audition.find(params[:audition_id])
    @artists = User.where(tags) #algorithm to find artists
    @artists = policy_scope(Artist)
  end
end
