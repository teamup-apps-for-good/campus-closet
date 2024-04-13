# frozen_string_literal: true

# controller for review
class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :require_admin, only: %i[index]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show; end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit; end

  # POST /reviews or /reviews.json
  def create
    build_review
    set_associations

    respond_to do |format|
      if @review.save
        format.html { redirect_to user_student_path(@review.user), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:rating, :pickup_id)
  end

  def build_review
    @review = Review.new(review_params)
  end

  def set_associations
    @pickup = Pickup.find_by(id: params[:review][:pickup_id])
    @review.pickup = @pickup
    @review.user = current_user
    @review.donor = @pickup.donor
  end
end
