# frozen_string_literal: true

# app/controllers/time_slots_controller.rb
class TimeSlotsController < ApplicationController
  before_action :set_time_slot, only: %i[show edit update destroy]

  # GET /time_slots
  def index
    @time_slots = current_user ? current_user.time_slots : []
  end

  # GET /time_slots/:id
  def show; end

  # GET /time_slots/new
  def new
    @time_slot = TimeSlot.new
  end

  # GET /time_slots/:id/edit
  def edit; end

  # POST /time_slots
  def create
    @time_slots = []

    time_slot_params.each do |time_slot_param|
      @time_slot = current_user.time_slots.new(time_slot_param.merge(status: 'available'))
      @time_slots << @time_slot unless @time_slot.save
    end

    if @time_slots.empty?
      redirect_to user_donor_path(current_user), notice: 'Time slots were successfully created.'
    else
      @time_slot = @time_slots.first
      render :new
    end
  end

  # PATCH/PUT /time_slots/:id
  def update
    if @time_slot.update(time_slot_params)
      redirect_to time_slot_url(@time_slot), notice: 'Time slot was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /time_slots/:id
  def destroy
    @time_slot.destroy
    redirect_to time_slots_url, notice: 'Time slot was successfully destroyed.'
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
    current_user.time_slots.new(time_slot_param.merge(status: 'available'))
  end

  def set_time_slot
    @time_slot = TimeSlot.find(params[:id])
  end

  def time_slot_params
    params.require(:time_slots).map do |time_slot|
      start_time = Time.zone.parse(time_slot['start_time'])

      end_time = start_time + 30.minutes
      time_slot.permit(:start_time, :end_time).merge(start_time:, end_time:)
    end
  end
end
