class CommentPolicy < ApplicationPolicy

  def create?
    user.is_admin? || user.is_moderator? || user.is_editor? || user.is_commenter?
  end

  def destroy?
    user.is_admin? || user.is_commenter?
  end
end
