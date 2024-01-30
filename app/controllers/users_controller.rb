# frozen_string_literal: true

# Controller for the user class
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    if @user.student?
      render 'show_student'
    else
      render 'show_donor'
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    create_and_respond(User, :user_url, :user_params)
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    update_and_respond(@user, :user_params)
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    destroy_and_respond(@user, :users_url, User.model_name)
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first, :last, :email, :phone, :address, :student)
  end
end
