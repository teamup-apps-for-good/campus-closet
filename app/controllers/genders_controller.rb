# frozen_string_literal: true

# controller for the genders
class GendersController < ApplicationController
  before_action :set_gender, only: %i[show edit update destroy]

  # GET /genders or /genders.json
  def index
    @genders = Gender.all
  end

  # GET /genders/1 or /genders/1.json
  def show; end

  # GET /genders/new
  def new
    @gender = Gender.new
  end

  # GET /genders/1/edit
  def edit; end

  # POST /genders or /genders.json
  def create
    create_and_respond(Gender, :gender_url, :gender_params)
  end

  # PATCH/PUT /genders/1 or /genders/1.json
  def update
    update_and_respond(@gender, :gender_params)
  end

  # DELETE /genders/1 or /genders/1.json
  def destroy
    destroy_and_respond(@gender, :genders_url, Gender.model_name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gender
    @gender = Gender.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gender_params
    params.require(:gender).permit(:name)
  end
end
