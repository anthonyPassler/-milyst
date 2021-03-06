class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user_authentication
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

  def toggle_complete?
    user_authentication
  end

  def move?
    user_authentication
  end

  private

  def user_authentication
    record.user == user
  end
end
