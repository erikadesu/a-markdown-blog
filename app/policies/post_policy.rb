class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def show_raw?
    true
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
