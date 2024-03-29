class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Pundit: allow-list approach
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "Vous n'avez pas l'autorisation d'effectuer cette action."
    redirect_to(root_path)
  end
  def after_sign_in_path_for(resource)
    if (stored_location = stored_location_for(resource))
      stored_location
    elsif resource.admin?
      root_path
    else
      user_path(resource)
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
