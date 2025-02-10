class ProductsController < ApplicationController
  def index
    @products = Product.include(:category).all
  end
  def show
    @product = Product.find(params[:id])
  end
end
