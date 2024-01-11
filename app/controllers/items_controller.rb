# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
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
    @item = Item.find params[:id]
    @item.update!(item_params)
    flash[:notice] = "#{@item.type.name} was successfully updated."
    redirect_to item_path(@item)
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "'#{@item.type.name}' deleted successfully."
    redirect_to items_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:color_id, :type_id, :gender_id, :description, :brand, :status_id, :size_id,
                                 :condition_id, :photo_link)
    end

    def upload_to_s3(image)
      s3 = Aws::S3::Resource.new(region: 'us-east-1')
      obj = s3.bucket('campuscloset').object("uploads/items/#{SecureRandom.uuid}/#{image.original_filename}")
      obj.upload_file(image.tempfile, acl:'public-read')
      @item.photo_link = obj.public_url
  end
end
