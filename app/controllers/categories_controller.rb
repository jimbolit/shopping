class CategoriesController < ApplicationController

  # This should not be in here but I can't figure out how to pass the CSRF token
  skip_before_action :verify_authenticity_token


    def create
        @category = Category.new(params[:category])
        @category.save
        redirect_to @category
    end

    def create!
      @category = Category.new(params[:category])
      @category.save
      redirect_to @category
  end


    def show

      @products = Product.where(category_id: params[ :id]).to_a
    #  print @products[0][:name]
    # this is just to see how it prints 
    
      @basket = session[:basket].select{|x| x[:order_quantity]>0}
      basket_ids = @basket.map {|x| x.values[0]}
     
    rescue NoMethodError
    # does not fail if the current basket is empty -  
    # not in original Sinatra code 
    # (not sure why it wasn't required)

      @basket_products = Product.where(id: basket_ids).to_a
    
      @sub_total = 0
      @basket_products.each{
         |i| @sub_total = @sub_total + i[:price] * @basket.find{
             |y| y[:product_id] == i[:id]
             }[:order_quantity]
      @subtotal ||= 0
     }
  
    end

    def increase_quantity
      puts "post sent"
      session[:basket] ||= []
      session[:basket].delete_if {|h| h["product_id"] == params[:product_id].to_i} 
      session[:basket] << {:product_id => params[:product_id].to_i, :order_quantity => params[:order_quantity].to_i}
      puts session[:basket]
    end

end

