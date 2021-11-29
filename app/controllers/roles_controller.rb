class RolesController < ApplicationController

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to @role
    else
      render new
    end
  end

  def new
    @role = Role.new
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
