class CoffeePolicy < ApplicationPolicy
  def show?
    true
  end

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
      scope.where(user: user)
    end
  end
end
