class WarehousesController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update]

  def index
  	@products = Product.all

  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to action: 'index'
  end

  def edit
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:name, :description, :price, :category, :image)
  end
end
