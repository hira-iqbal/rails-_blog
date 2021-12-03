# continue
class UsersController < ApplicationController
 before_action :authenticate_user!, only: [:index, :update]

  def index
   if current_user.role.name == "admin"
     @user = User.all
     else
      redirect_to root_path, alert: "Unauthorized access"
    end
  end

  def new
    @user = User.new

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "user successfully created"
     else
      render :new
    end
  end

  def edit
  end

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
