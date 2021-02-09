class OrderProductsController < ApplicationController

    def create
        @order_product = Order_product.new(params[:order_product])
        @order_product.save
        redirect_to @order_product
    end


end
