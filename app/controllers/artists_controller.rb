class ArtistsController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    @audition = Audition.find(params[:audition_id])
    @artists = ArtistsMatcherService.new(@audition).call.uniq
  end
end
