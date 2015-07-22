class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :create, :destroy]
  
  def show
  end

  def new
  end

  def edit
    @catalog = Catalog.find(params[:catalog_id])
  end

  def create
    @product = @catalog.products.create(product_params)
    redirect_to catalog_path(@catalog)
  end

  def update 
    @product = @catalog.products.update(product_params)
    redirect_to catalog_path(@catalog)
  end 
 
  def destroy
    @product = @catalog.products.find(params[:id])
    @product.destroy
    redirect_to catalog_path(@catalog)
  end

  private
    def set_product
      @catalog = Catalog.find(params[:catalog_id])
    end
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
