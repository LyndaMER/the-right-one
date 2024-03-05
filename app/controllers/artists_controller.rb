class ArtistsController < ApplicationController

  def index
    @audition = Audition.find(params[:audition_id])
    @artists = ArtistsMatcherService.new(@audition).call
    @artists = policy_scope(Artist)
  end


end
