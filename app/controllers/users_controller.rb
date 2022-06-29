class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users 
  end

  # PUT|PATCH /users/1
  def edit 
  end
  
  def update
    if @user.update(user_params)
      render json: { message: "Successfully updated user" }
    else
      head :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def destroy 
    @user.destroy
    render json: { message: "Successfully deleted user from database" }
  end

  private 

  def set_user 
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :position, :phone_number, :image, :password)
  end
end
