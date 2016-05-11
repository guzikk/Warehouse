class WarehousesController < ApplicationController
  
  before_action :set_product, only: [:show, :edit, :update, :delete]

  def index
  	@products = Product.all
    @product = Product.first
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
    if @product.save
      @category = Category.new
    @link = Link.new
    @link[:product_id]= 1
    @link[:category_id] =1
    @category[:name] = 'Elektronika'
    @category[:product_id]= 1
  	@product.save
    @category.save
    @link.save
  	redirect_to action: 'index'
  end
end



  def edit
  end

  def update
      if @product.update_attributes(product_params)
      flash[:notice] = "Product was updated"
    end
    redirect_to(action:'index')
  end

  def delete

  end

  def destroy
    product = Product.find(params[:id]).destroy
    flash[:notice] = "Product #{product.name} was deleted"
    redirect_to(action:'index')

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:name, :description, :price, :category, :image)
  end
end
