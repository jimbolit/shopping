class BasketsController < ApplicationController

    def index
            @basket = []
            @basket = session[:basket].select{|x| x["order_quantity"]>0}
           # puts @basket
            basket_ids = @basket.map {|x| x.values[0]}
            # puts basket_ids
            @products = Product.where(id: basket_ids).to_a
           puts @products.inspect
            @sub_total = 5
           
        
            # does not fail if the current basket is empty -  
            # not in original Sinatra code 
            # (not sure why it wasn't required)


        #   @products = Product.where(id: [1,2,3]).to_a
        #  print @products
         # @products = Product.where(id: basket_ids).to_a
          #  @products = Product.all
            @sub_total = 0
            @products.each{
               |i| @sub_total = @sub_total + i[:price] * @basket.find{
                |y| y["product_id"] == i[:id]
                }.to_h["order_quantity"].to_i
            }
           
         if @basket == []
           render :basket_empty
         else
            render :index  
     end
    rescue NoMethodError
    end
end

