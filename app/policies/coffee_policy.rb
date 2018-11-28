class CoffeePolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
