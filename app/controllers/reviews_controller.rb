class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    if current_user.admin === true
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      render :edit
    else
      flash[:alert] = "You do not have permission to edit reviews"
    end
    redirect_to "/products"
  end

  def update
    if current_user.admin === true
      @review = Review.find(params[:id])
      if @review.update(review_params)
        redirect_to product_path(@review.product)
      else
        render :edit
      end
    end
  end

def destroy
  if current_user.admin === true
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  else
    flash[:notice] = "You do not have those privileges"    
  end
end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end
