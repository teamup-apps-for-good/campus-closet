# frozen_string_literal: true

# controller for the statuses
class StatusesController < ApplicationController
  before_action :set_status, only: %i[show edit update destroy]

  # GET /statuses or /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1 or /statuses/1.json
  def show; end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit; end

  # POST /statuses or /statuses.json
  def create
    create_and_respond(Status, :status_url, :status_params)
  end

  # PATCH/PUT /statuses/1 or /statuses/1.json
  def update
    update_and_respond(@status, :status_url, :status_params)
  end

  # DELETE /statuses/1 or /statuses/1.json
  def destroy
    @status.destroy!

    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_status
    @status = Status.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def status_params
    params.require(:status).permit(:name)
  end
end
