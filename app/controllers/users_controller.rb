# continue
class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :set_user, only: [:show, :update]
  def index
   if current_user.role.name == "admin"
     @users = User.all
     else
      redirect_to root_path, alert: "You are not authorize for this action."
    end
  end

  def new
    @user = User.new
  end

  def show; end

  def create

    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User successfully created."
     else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
       redirect_to @user
     else
      render :edit
    end
  end

 def user_params
    params.require(:user).permit(:name, :surname, :password, :role_id)
 end
end
