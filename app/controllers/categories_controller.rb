class CategoriesController < ApplicationController

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

      @basket = session[:basket].select{|x| x[:order_quantity]>0}
      basket_ids = @basket.map {|x| x.values[0]}
     
    rescue NoMethodError
    # does not fail if the current basket is empty -  not in original Sinatra code (not sure why it wasn't required)

      @basket_products = Product.where(id: basket_ids).to_a
    
      @sub_total = 0
      @basket_products.each{
         |i| @sub_total = @sub_total + i[:price] * @basket.find{
             |y| y[:product_id] == i[:id]
             }[:order_quantity]
     }
  
    end

end

