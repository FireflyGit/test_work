class ProductsController < ApplicationController
  def new
  end

  def create
    @catalog = Catalog.find(params[:catalog_id])
    @product = @catalog.products.create(product_params)
    redirect_to catalog_path(@catalog)
  end
 
  def destroy
    @catalog = Catalog.find(params[:catalog_id])
    @product = @catalog.products.find(params[:id])
    @product.destroy
    redirect_to catalog_path(@catalog)
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
