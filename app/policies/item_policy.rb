class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user_authentication
  end

  def destroy?
    user_authentication
  end

  private

  def user_authentication
    record.user == user
  end
end
