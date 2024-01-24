# frozen_string_literal: true

class ItemsController < ApplicationController
  include ActionController::Cookies

  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    cookies_color_list = []
    cookies_type_list = []
    cookies_gender_list = []
    cookies_status_list = []
    cookies_size_list = []
    cookies_condition_list = []

    params.each_key do |key|
      if key.include?('color_')
        start = 'color_'.length
        id = params[key][start..key.length].to_i
        color = Color.find(id)
        cookies_color_list.append(color)
      end
      if key.include?('type_')
        start = 'type_'.length
        id = params[key][start..key.length].to_i
        type = Type.find(id)
        cookies_type_list.append(type)
      end
      if key.include?('gender_')
        start = 'gender_'.length
        id = params[key][start..key.length].to_i
        gender = Gender.find(id)
        cookies_gender_list.append(gender)
      end
      if key.include?('status_')
        start = 'status_'.length
        id = params[key][start..key.length].to_i
        status = Status.find(id)
        cookies_status_list.append(status)
      end
      if key.include?('size_')
        start = 'size_'.length
        id = params[key][start..key.length].to_i
        size = Size.find(id)
        cookies_size_list.append(size)
      end
      next unless key.include?('condition_')

      start = 'condition_'.length
      id = params[key][start..key.length].to_i
      condition = Condition.find(id)
      cookies_condition_list.append(condition)
    end

    cookies[:color] = cookies_color_list.empty? ? nil : cookies_color_list

    cookies[:type] = cookies_type_list.empty? ? nil : cookies_type_list

    cookies[:gender] = cookies_gender_list.empty? ? nil : cookies_gender_list

    cookies[:status] = cookies_status_list.empty? ? nil : cookies_status_list

    cookies[:size] = cookies_size_list.empty? ? nil : cookies_size_list

    cookies[:condition] = cookies_condition_list.empty? ? nil : cookies_condition_list

    @items = Item.all

    @items = @items.where(color: cookies[:color]) unless cookies[:color].nil?

    @items = @items.where(type: cookies[:type]) unless cookies[:type].nil?

    @items = @items.where(gender: cookies[:gender]) unless cookies[:gender].nil?

    @items = @items.where(status: cookies[:status]) unless cookies[:status].nil?

    @items = @items.where(size: cookies[:size]) unless cookies[:size].nil?

    @items = @items.where(condition: cookies[:condition]) unless cookies[:condition].nil?

    @cookies = cookies
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    upload_to_s3(params[:item][:image]) if params[:item][:image].present?

    if @item.save
      # Handle the image upload here if necessary
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /items/color/1 or /items/color/1.json
  def show_by_color
    @color = Color.find(params[:color_id])
    @items = Item.where(color: @color)
  end

  # GET /items/filter
  def filter; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:color_id, :type_id, :gender_id, :description, :brand, :status_id, :size_id,
                                 :condition_id, :image_url)
  end

  def upload_to_s3(image)
    s3 = Aws::S3::Resource.new(region: 'us-east-1',
                               credentials: Aws::Credentials.new(
                                 ENV['AWS_ACCESS_KEY_ID'],
                                 ENV['AWS_SECRET_ACCESS_KEY']
                               ))
    obj = s3.bucket('campuscloset').object("uploads/items/#{SecureRandom.uuid}/#{image.original_filename}")
    obj.upload_file(image.tempfile)
    @item.image_url = obj.public_url
  end
end
