class UserPolicy < ApplicationPolicy

  def create?
   user.is_admin?
  end

  def index?
    create?
  end

  def new?
   create?
  end

  def destroy?
    create?
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
end
