class ArticlePolicy < ApplicationPolicy

  def index?
    user.is_admin? || user.is_moderator?|| user.is_editor? || user.is_commenter?
  end

  def new?
   user.is_admin? || user.is_moderator?
  end

  def create?
   user.is_admin?  || user.is_moderator?
  end

  def show?
   user.is_admin?  || user.is_moderator? || user.is_editor? || user.is_commenter?
  end

  def update?
   user.is_admin? || user.is_editor?
  end

  def edit?
    user.is_admin?  || user.is_editor?
  end

  def destroy?
    user.is_admin?
  end
end
