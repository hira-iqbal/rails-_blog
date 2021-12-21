class UserPolicy < ApplicationPolicy

  def index?
    user.is_admin?
  end

  def new?
   user.is_admin?
  end

  def create?
   user.is_admin?
  end

  def show?
   user.is_admin?  || user.is_moderator? || user.is_editor? || user.is_commenter?
  end

  def update?
   user.is_admin? || user.is_editor? || user.is_commenter? || user.is_moderator?
  end

  def edit?
    user.is_admin?  || user.is_editor? || user.is_commenter? || user.is_moderator?
  end

  def destroy?
    user.is_admin?
  end
end
