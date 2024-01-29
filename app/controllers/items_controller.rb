# frozen_string_literal: true

# controller for the items
class ItemsController < ApplicationController
  include ActionController::Cookies

  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    process_cookie_params

    @items = Item.all
    filter_items_by_cookies

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
    update_and_respond(@item, :item_url, :item_params)
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:color_id, :type_id, :gender_id, :description, :status_id, :size_id,
                                 :condition_id, :image_url)
  end

  def upload_to_s3(image)
    s3 = Aws::S3::Resource.new(region: 'us-east-1',
                               credentials: Aws::Credentials.new(
                                 ENV.fetch('AWS_ACCESS_KEY_ID', nil),
                                 ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
                               ))
    obj = s3.bucket('campuscloset').object("uploads/items/#{SecureRandom.uuid}/#{image.original_filename}")
    obj.upload_file(image.tempfile)
    @item.image_url = obj.public_url
  end

  def process_params_with_prefix(params, prefix, model_class)
    items_list = []

    params.each_key do |key|
      next unless key.start_with?(prefix)

      start = prefix.length
      id = params[key][start..].to_i
      item = model_class.find(id)
      items_list.append(item)
    end

    items_list
  end

  def process_cookie_params
    %w[color type gender status size condition].each do |prefix|
      cookie_list = process_params_with_prefix(params, "#{prefix}_", prefix.capitalize.constantize)
      cookies[prefix.to_sym] = cookie_list.empty? ? nil : cookie_list
    end
  end

  def filter_items_by_cookies
    %i[color type gender status size condition].each do |cookie_name|
      @items = @items.where(cookie_name => cookies[cookie_name]) unless cookies[cookie_name].nil?
    end
  end
end
