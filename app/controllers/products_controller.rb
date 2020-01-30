class ProductsController < ApplicationController

  def index
    if params[:most_reviews]
      @products = Product.most_reviews
    else
      @products = Product.all
    end
    render :index
  end

  def new
    if current_user.admin === true
      @product = Product.new
      render :new
    else
      redirect_to '/'
      flash[:notice] = "You do not have privileges to create products"
    end
  end

  def create
    if current_user.admin === true
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product successfully added!"
        redirect_to products_path
      else
        render :new
      end
    end
  end

  def edit
    if current_user.admin === true
      @product = Product.find(params[:id])
      render :edit
    else
      redirect_to '/'
      flash[:notice] = "Only admin can edit products"
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.admin === true
      @product = Product.find(params[:id])
      @product.destroy
      flash[:notice] = "Product successfully Deleted"
      redirect_to '/'
    else
      redirect_to '/'
      flash[:notice] = "Only admin can delete products"
    end
  end

  private
  def product_params
    params.require(:product).permit(:prod_name, :cost, :country_of_origin)
  end
end
