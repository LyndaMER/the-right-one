class PagesController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def home
    authorize current_user, policy_class: PagePolicy
  end

  def design_system
  end
end
