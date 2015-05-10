class ProductsController < ApplicationController
  
  before_action :administrative_user, only: [:new, :create, :edit, :update]
  
  
  
  def index
    @product = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to @product
    else
      render 'edit'
    end
  end
  
  
  def new
    @product = Product.new
  end
  

def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
end

  private

    def product_params
      params.require(:product).permit(:title, :price, :description, :image)
    end
    
    
    
    def administrative_user
      if logged_in?
        if ! current_user.admin?
          redirect_to(root_url)
          flash[:danger] = "Only Admin Users are authorized to do this!"
        end
      end
      if ! logged_in?
          redirect_to(login_url)
          flash[:danger] = "To do this you must be logged in (and must be an admin user)!"
      end
    end
end
