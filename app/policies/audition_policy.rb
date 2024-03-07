class AuditionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user_is_admin?
  end

  def create?
    user_is_admin?
  end

  def new?
    create?
  end

  def show?
    true
  end
end
