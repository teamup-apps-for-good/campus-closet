# frozen_string_literal: true

# controller for colors
class ColorsController < ApplicationController
  before_action :set_color, only: %i[show edit update destroy]

  # GET /colors or /colors.json
  def index
    @colors = Color.all
  end

  # GET /colors/1 or /colors/1.json
  def show; end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit; end

  # POST /colors or /colors.json
  def create
    create_and_respond(Color, :color_url, :color_params)
  end

  # PATCH/PUT /colors/1 or /colors/1.json
  def update
    update_and_respond(@color, :color_params)
  end

  # DELETE /colors/1 or /colors/1.json
  def destroy
    destroy_and_respond(@color, :colors_url, Color.model_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_color
    @color = Color.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def color_params
    params.require(:color).permit(:name)
  end
end
