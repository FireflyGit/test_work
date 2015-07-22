class CatalogsController < ApplicationController
  before_action :set_catalog, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def index
    @catalog = Catalog.all
  end

  def edit
  end

  def new
    @catalog = Catalog.new
  end

  def create
    @catalog = Catalog.new(catalog_params)
 
    if @catalog.save
      redirect_to @catalog
    else
      render 'new'
    end
  end

  def update
    if @catalog.update(catalog_params)
      redirect_to @catalog
    else
      render 'edit'
    end
  end

   def destroy
    @catalog.destroy
   
    redirect_to catalogs_path
  end
  
  private
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    def catalog_params
      params.require(:catalog).permit(:name, :description)
    end
end
