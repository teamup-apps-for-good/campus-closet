# frozen_string_literal: true

# app/controllers/time_slots_controller.rb
class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[index]

  # GET /time_slots or /time_slots.json
  def index
    @time_slots = current_user ? current_user.time_slots : []
    @slots = @time_slots
  end

  def show
    @time_slot = TimeSlot.find(params[:id])
  end

  # GET /time_slots/new
  def new
    @time_slot = TimeSlot.new
  end

  # GET /time_slots/1/edit
  def edit
    @time_slot = TimeSlot.find(params[:id])
  end

  # POST /time_slots or /time_slots.json
  def create
    time_slot_params[:time_slots].each do |time_slot_param|
      @time_slot = build_time_slot(time_slot_param)

      return redirect_to time_slots_path, notice: 'Time slots were not saved.' unless @time_slot.save

      if time_slot_param[:start_time].blank? || time_slot_param[:end_time].blank?
        return redirect_to new_time_slot_path, alert: 'Start and end times cannot be empty.'
      end
    end

    redirect_to time_slots_path, notice: 'Time slots were successfully created.'
  end

  # PATCH/PUT /time_slots/1 or /time_slots/1.json
  def update
    respond_to do |format|
      if @time_slot.update(time_slot_params)
        format.html { redirect_to time_slot_url(@time_slot), notice: 'Time slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_slot }
      end
    end
  end

  # DELETE /time_slots/1 or /time_slots/1.json
  def destroy
    @time_slot.destroy!

    respond_to do |format|
      format.html { redirect_to time_slots_url, notice: 'Time slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_unavailable
    @time_slot = TimeSlot.find(params[:id])
    if @time_slot.update(status: 'unavailable')
      render json: { message: 'Time slot marked as unavailable.' }, status: :ok
    else
      render json: { error: 'Failed to mark time slot as unavailable. Please try again.' },
             status: :unprocessable_entity
    end
  end

  private

  def build_time_slot(time_slot_param)
    time_slot = TimeSlot.new(time_slot_param)
    time_slot.status = 'available'
    time_slot.donor_id = current_user.id if current_user
    time_slot
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def time_slot_params
    params.permit(time_slots: %i[start_time end_time])
  end
end
