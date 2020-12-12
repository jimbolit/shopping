class ProductsController < ApplicationController

    def create!
        @product = Product.new(params[:product])
        @product.save
        redirect_to @product
    end

    def create
        @product = Product.new(params[:product])
        @product.save
        redirect_to @product
    end


end
