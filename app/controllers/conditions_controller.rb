# frozen_string_literal: true

# controller for the conditions
class ConditionsController < ApplicationController
  before_action :set_condition, only: %i[show edit update destroy]

  # GET /conditions or /conditions.json
  def index
    @conditions = Condition.all
  end

  # GET /conditions/1 or /conditions/1.json
  def show; end

  # GET /conditions/new
  def new
    @condition = Condition.new
  end

  # GET /conditions/1/edit
  def edit; end

  # POST /conditions or /conditions.json
  def create
    create_and_respond(Condition, :condition_url, :condition_params)
  end

  # PATCH/PUT /conditions/1 or /conditions/1.json
  def update
    update_and_respond(@condition, :condition_url, :condition_params)
  end

  # DELETE /conditions/1 or /conditions/1.json
  def destroy
    @condition.destroy!

    respond_to do |format|
      format.html { redirect_to conditions_url, notice: 'Condition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_condition
    @condition = Condition.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def condition_params
    params.require(:condition).permit(:name)
  end
end
