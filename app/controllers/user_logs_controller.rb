class UserLogsController < ApplicationController
  before_action :set_user_log, only: %i[ show update destroy ]

  # GET /user_logs
  def index
    if current_user && current_user.admin?
      @user_logs = UserLog.all
      render json: @user_logs
    else  
      render json: { message: "You are not an admin" }
    end
  end

  # GET /user_logs/1
  def show
    if current_user && current_user.admin?
      render json: @user_log
    else 
      render json: { message: "You are not an admin" }
    end
  end

  # POST /user_logs
  def create
    @user_log = UserLog.new(user_log_params)

    if @user_log.save
      render json: @user_log, status: :created, location: @user_log
    else
      render json: @user_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_logs/1
  def update
    unless current_user && current_user.admin?
      if @user_log.update(user_log_params)
        render json: @user_log
      else
        render json: @user_log.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /user_logs/1
  def destroy
    if current_user && current_user.admin?
      @user_log.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_log
      @user_log = UserLog.find(params[:id])
    end

    def set_admin 
      current_user.admin?
    end

    # Only allow a list of trusted parameters through.
    def user_log_params
      params.require(:user_log).permit(:from, :to, :sign_in_time, :sign_out_time, :user_id)
    end
end
