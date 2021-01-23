class Api::V1::MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :update, :destroy]

  def index
    @merchants = Merchant.all

    render json: MerchantSerializer.new(@merchants)
  end

  def show
    render json: MerchantSerializer.new(@merchant)
  end

  def create
    @merchant = Merchant.new(merchant_params)

    if @merchant.save
      render json: MerchantSerializer.new(@merchant), status: :created
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  def update
    if @merchant.update(merchant_params)
      render json: MerchantSerializer.new(@merchant)
    else
      render json: @merchant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @merchant.destroy
  end

  private
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.permit(:name, :created_at, :updated_at)
    end
end
