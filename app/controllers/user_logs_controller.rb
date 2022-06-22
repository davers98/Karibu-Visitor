class UserLogsController < ApplicationController
  before_action :set_user_log, only: %i[ show update destroy ]

  # GET /user_logs
  def index
      @user_logs = UserLog.all
      render json: @user_logs
  end

  # GET /user_logs/1
  def show
    render json: @user_log.current_user
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
    if @user_log.update(user_log_params)
    #   render json: @user_log
    # else
      render json: @user_log.errors, { message: "You are not allowed to perform this operation" }
    end
  end

  # DELETE /user_logs/1
  def destroy
    if @user_log.destroy 
      render json: { message: "You are not allowed to perform this operation" }
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
