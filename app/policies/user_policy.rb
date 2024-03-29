class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def search?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def create?
    true
  end
end
