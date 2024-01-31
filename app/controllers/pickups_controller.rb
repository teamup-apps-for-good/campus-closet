# frozen_string_literal: true

# controller for the pickups
class PickupsController < ApplicationController
  before_action :set_pickup, only: %i[show edit update destroy]

  # GET /pickups or /pickups.json
  def index
    @pickups = Pickup.all
  end

  # GET /pickups/1 or /pickups/1.json
  def show; end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
  end

  # GET /pickups/1/edit
  def edit; end

  # POST /pickups or /pickups.json
  def create
    create_and_respond(Pickup, :pick_url, :pickup_params)
  end

  # PATCH/PUT /pickups/1 or /pickups/1.json
  def update
    update_and_respond(@pickup, :pickup_params)
  end

  # DELETE /pickups/1 or /pickups/1.json
  def destroy
    destroy_and_respond(@pickup, :pickups_url, Pickup.model_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pickup
    @pickup = Pickup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pickup_params
    params.require(:pickup).permit(:donor_id, :receiver_id, :item_id)
  end
end
