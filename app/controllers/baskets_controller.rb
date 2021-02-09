class BasketsController < ApplicationController

    def index
            
      
      
            @basket = []
            @basket = session[:basket].select{|x| x["order_quantity"]>0}
           
            basket_ids = @basket.map {|x| x.values[0]}

            @basket_products = Product.where(id: basket_ids).to_a

            puts @basket_products
          
            @sub_total = 0
            @basket_products.each{
               |i| @sub_total = @sub_total + i[:price] * @basket.find{
                   |y| y["product_id"] == i[:id]
                   }.to_h["order_quantity"].to_i
            @subtotal ||= 0
           }
      
           
         if @basket == []
           render :basket_empty
         else
            render :index  
     end
  #  rescue NoMethodError
            # does not fail if the current basket is empty -  
            # not in original Sinatra code 
            # (not sure why it wasn't required)
    end
end

