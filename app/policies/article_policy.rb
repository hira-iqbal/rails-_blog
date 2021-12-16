class ArticlePolicy < ApplicationPolicy
  def index?
    user_is_admin? || user_is_moderator?|| user_is_editor? || user_is_commenter?
  end

  def new?
   user.is_admin? || user_is_moderator?
  end

  def create?
   user.is_admin?  || user_is_moderator?
  end

  def show?
   user.is_admin?  || user_is_moderator? || user_is_editor? || user_is_commenter?
  end

  def update?
   user.is_admin? || user_is_editor?
  end

  def edit?
    user.is_admin?  || user_is_editor?
  end

  def destroy?
    user.is_admin?
  end

end
