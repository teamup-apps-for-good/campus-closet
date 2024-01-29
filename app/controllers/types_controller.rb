# frozen_string_literal: true

# controller for the types
class TypesController < ApplicationController
  before_action :set_type, only: %i[show edit update destroy]

  # GET /types or /types.json
  def index
    @types = Type.all
  end

  # GET /types/1 or /types/1.json
  def show; end

  # GET /types/new
  def new
    @type = Type.new
  end

  # GET /types/1/edit
  def edit; end

  # POST /types or /types.json
  def create
    create_and_respond(Type, :type_url, :type_params)
  end

  # PATCH/PUT /types/1 or /types/1.json
  def update
    update_and_respond(@type, :type_params)
  end

  # DELETE /types/1 or /types/1.json
  def destroy
    destroy_and_respond(@type, :types_url, Type.model_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type
    @type = Type.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def type_params
    params.require(:type).permit(:name)
  end
end
