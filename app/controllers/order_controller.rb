class OrderController < ApplicationController

    def create
        @order = Order.new(params[:order])
        @order.save
        redirect_to @order
    end

end
