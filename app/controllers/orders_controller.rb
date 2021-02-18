class OrdersController < ApplicationController

    def new
        @order = Order.new

        @basket = session[:basket].select{|x| x["order_quantity"]>0}
        basket_ids = @basket.map {|x| x.values[0]}
        
        @basket_products = Product.where(id: basket_ids).to_a

        @sub_total = 0
      @basket_products.each{
         |i| @sub_total = @sub_total + i[:price] * @basket.find{
             |y| y["product_id"] == i[:id]
             }.to_h["order_quantity"].to_i
      @subtotal ||= 0
     }

    end
    
    def create
        @order = Order.new(first_name: params[:order][:first_name])
        if @order.save
         redirect_to @order
        else
         render :show
        end
    
        @basket = session[:basket].select{|x| x["order_quantity"]>0}
        basket_ids = @basket.map {|x| x.values[0]}
        
        @basket_products = Product.where(id: basket_ids).to_a

        @sub_total = 0
        @basket_products.each{
            |i| @sub_total = @sub_total + i[:price] * @basket.find{
                |y| y["product_id"] == i[:id]
                }.to_h["order_quantity"].to_i
        @subtotal ||= 0
        }
    end

    def show

    end

    def index

        @basket = session[:basket].select{|x| x["order_quantity"]>0}
        basket_ids = @basket.map {|x| x.values[0]}
        
        @basket_products = Product.where(id: basket_ids).to_a

        @sub_total = 0
      @basket_products.each{
         |i| @sub_total = @sub_total + i[:price] * @basket.find{
             |y| y["product_id"] == i[:id]
             }.to_h["order_quantity"].to_i
      @subtotal ||= 0
     }
    
    
    end

    private

    def order_params
      params.require(:order).permit(:user, :address, :first_name, :last_name, :email, :phone_number, :total, :text, :comments)
    end


end



