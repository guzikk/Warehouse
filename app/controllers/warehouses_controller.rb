class WarehousesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :delete]

  def index
  	@products = Product.all
    @product = Product.first
  end

  def show
  end

  def new
  	@product = Product.new
    @link = Link.new
  end

  def create
  	@link = Link.new
    @product = Product.new(product_params)
    @product.save
   	redirect_to action: 'index'
  end

  def edit

#<h1>Edit product</h1>
#<%= form_for(:product, url:{action:'update', id:@product.id}, method: :put ) do |field| %>
#<%= render(partial: 'form', locals:{f: field})%>
#<%=link_to('Back', {action: 'index'}, class: 'btn btn-warning')%>
#<%=submit_tag('update', class:'btn btn-primary') %>
#<%end%>
  end

  def update
    #params[:product][:category_ids] ||= []
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
  	params.require(:product).permit(:name, :description, :price, :image, :category_ids=>[])
  end

end


#<% Category.all.each do |category|%>
    

 #   <%= check_box_tag "product[category_ids][]", category.id, @product.categories.include?(category) %>
  #      <%= category.name %>
   # <% end %>
