class ListPolicy < ApplicationPolicy
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

  def new_list_email?
    true
  end

  private

  def user_authentication
    record.user == user
  end
end
