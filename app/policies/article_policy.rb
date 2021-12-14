  class ArticlePolicy < ApplicationPolicy
  def index?
    user_is_admin? || user_is_moderator?|| user_is_editor? || user_is_commenter?
  end

  def new?
   user_is_admin? || user_is_moderator?
  end

  def create?
   user_is_admin?  || user_is_moderator?
  end

  def show?
   user_is_admin?  || user_is_moderator? || user_is_editor? || user_is_commenter?
  end

  def update?
   user_is_admin? || user_is_editor?
  end

  def edit?
    user_is_admin?  || user_is_editor?
  end

  def destroy?
    user_is_admin?
  end

  def user_is_admin?
    user.role.name == "admin"
  end

  def user_is_moderator?
    user.role.name == "moderator"
  end

  def user_is_commenter?
    user.role.name == "commenter"
  end

  def user_is_editor?
    user.role.name == "editor"
  end
  end
