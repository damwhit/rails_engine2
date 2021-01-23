class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    if params[:merchant_id]
      @items = Item.where(merchant_id: params[:merchant_id])
    else
      @items = Item.all
    end

    render json: ItemSerializer.new(@items)
  end

  def show
    render json: ItemSerializer.new(@item)
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: ItemSerializer.new(@item), status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: ItemSerializer.new(@item)
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.permit(:name, :description, :unit_price, :merchant_id)
    end
end
