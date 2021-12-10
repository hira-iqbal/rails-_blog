class UsersController < ApplicationController

 def index
  @user = User.all
 end
  def show
    @user = User.find_by(id: params[:id])
  end

  def create
  end

  def edit
  end


  def update
    @user = User.find_by(id: params[:id])
    @role = Role.find_by(role_id: params[:role_id])

    if current_user == "admin"
      @user.update(user_params)
    end
  end

 def user_params
    params.require(:user).permit(:name, :surname, :password, :role_id)
 end
end
