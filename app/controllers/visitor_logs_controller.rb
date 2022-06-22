class VisitorLogsController < ApplicationController
  before_action :set_visitor_log, only: %i[ show update destroy ]

  # GET /visitor_logs
  def index
    @visitor_logs = VisitorLog.all

    render json: @visitor_logs
  end

  # GET /visitor_logs/1
  def show
    render json: @visitor_log
  end

  # POST /visitor_logs
  def create
    @visitor_log = VisitorLog.new(visitor_log_params)

    if @visitor_log.save
      render json: @visitor_log, status: :created, location: @visitor_log
    else
      render json: @visitor_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visitor_logs/1
  def update
    if @visitor_log.update(visitor_log_params)
    #   render json: @visitor_log
    # else
      render json: @visitor_log.errors, { message: "You are not allowed to perform this operation" }
    end
  end

  # DELETE /visitor_logs/1
  def destroy
    if @visitor_log.destroy
      render json: { message: "You are not allowed to perform this operation" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visitor_log
      @visitor_log = VisitorLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def visitor_log_params
      params.require(:visitor_log).permit(:name, :from, :to, :sign_in_time, :sign_out_time)
    end
end
