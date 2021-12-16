class CommentPolicy < ApplicationPolicy

  def create?
   set_role
  end

  def destroy?
   set_role
  end

  def set_role
  user.role.name == "commenter" || user.role.name == "admin"
  end
end
