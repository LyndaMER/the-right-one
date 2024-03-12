class PagesController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def home
    authorize current_user, policy_class: PagePolicy
    @auditions = Audition.all
    @users = User.where.not(pola_face: nil).shuffle
    @lastuser = User.where.not(pola_face: nil).last(1)
  end

  def design_system
  end

  def test
  end
end
