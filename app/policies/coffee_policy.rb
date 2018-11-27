class CoffeePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == current_user
  end

  def destroy?
    user == current_user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
