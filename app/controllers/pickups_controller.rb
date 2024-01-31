class PickupsController < ApplicationController
  before_action :set_pickup, only: %i[ show edit update destroy ]

  # GET /pickups or /pickups.json
  def index
    @pickups = Pickup.all
  end

  # GET /pickups/1 or /pickups/1.json
  def show
  end

  # GET /pickups/new
  def new
    @pickup = Pickup.new
  end

  # GET /pickups/1/edit
  def edit
  end

  # POST /pickups or /pickups.json
  def create
    @pickup = Pickup.new(pickup_params)

    respond_to do |format|
      if @pickup.save
        format.html { redirect_to pickup_url(@pickup), notice: "Pickup was successfully created." }
        format.json { render :show, status: :created, location: @pickup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickups/1 or /pickups/1.json
  def update
    respond_to do |format|
      if @pickup.update(pickup_params)
        format.html { redirect_to pickup_url(@pickup), notice: "Pickup was successfully updated." }
        format.json { render :show, status: :ok, location: @pickup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pickup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickups/1 or /pickups/1.json
  def destroy
    @pickup.destroy!

    respond_to do |format|
      format.html { redirect_to pickups_url, notice: "Pickup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup
      @pickup = Pickup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pickup_params
      params.require(:pickup).permit(:donator_id, :receiver_id, :item_id)
    end
end
