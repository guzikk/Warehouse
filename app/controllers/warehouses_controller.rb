class WarehousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :delete]

  def index
  	@products = Product.all
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
    if @product = Product.new(product_params)
      flash[:notice] = 'Product was created'
    end
    @product.save
   	redirect_to action:'index'
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = 'Product was updated'
    end
    redirect_to action:'index'
  end

  def delete
  end

  def destroy
    product = Product.find(params[:id]).destroy
    flash[:notice] = "Product #{product.name} was deleted"
    redirect_to action:'index'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:name, :description, :price, :image, :category_ids=>[])
  end

end