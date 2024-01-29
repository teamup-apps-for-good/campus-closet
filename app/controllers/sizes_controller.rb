# frozen_string_literal: true

# controller for the sizes
class SizesController < ApplicationController
  before_action :set_size, only: %i[show edit update destroy]

  # GET /sizes or /sizes.json
  def index
    @sizes = Size.all
  end

  # GET /sizes/1 or /sizes/1.json
  def show; end

  # GET /sizes/new
  def new
    @size = Size.new
  end

  # GET /sizes/1/edit
  def edit; end

  # POST /sizes or /sizes.json
  def create
    create_and_respond(Size, :size_url, :size_params)
  end

  # PATCH/PUT /sizes/1 or /sizes/1.json
  def update
    update_and_respond(@size, :size_params)
  end

  # DELETE /sizes/1 or /sizes/1.json
  def destroy
    destroy_and_respond(@size, :sizes_url, Size.model_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_size
    @size = Size.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def size_params
    params.require(:size).permit(:name)
  end
end
