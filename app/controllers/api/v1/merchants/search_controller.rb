class Api::V1::Merchants::SearchController < ApplicationController
  def index
    @merchants = Merchant.search_all(attribute, value)

    render json: MerchantSerializer.new(@merchants)
  end

  def show
    @merchant = Merchant.search(attribute, value)

    render json: MerchantSerializer.new(@merchant)
  end

  private

    def attribute
      merchant_params.keys[0]
    end

    def value
      merchant_params[attribute]
    end

    def merchant_params
      params.permit(:name, :created_at, :updated_at)
    end
end
