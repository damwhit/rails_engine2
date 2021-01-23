class Api::V1::Items::SearchController < ApplicationController
  def index
    @items = Item.search_all(attribute, value)

    render json: ItemSerializer.new(@items)
  end

  def show
    @item = Item.search(attribute, value)

    render json: ItemSerializer.new(@item)
  end

  private

    def attribute
      item_params.keys[0]
    end

    def value
      item_params[attribute]
    end

    def item_params
      params.permit(:name, :description, :unit_price, :created_at, :updated_at)
    end
end
