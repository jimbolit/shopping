class OrdersController < ApplicationController

    def new
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
        @order = Order.new(order_params)
        @order.save!
        order = @order

        @basket = session[:basket].select{|x| x["order_quantity"]>0}
        basket_ids = @basket.map {|x| x.values[0]}
        @basket_products = Product.where(id: basket_ids)

        #create all the order_products
        @basket_products.each do |i|
          product = @order.order_products.new(
            order_quantity: @basket.find{|x| x["product_id"] == i[:id]}.to_h["order_quantity"].to_i, product: i)
          product.save!
        end

        session[:order_id] = @order[:id]
        puts "The session order_id is #{session["order_id"]}"
         redirect_to @order
    
        # @basket = session[:basket].select{|x| x["order_quantity"]>0}
        # basket_ids = @basket.map {|x| x.values[0]}
        
        # @basket_products = Product.where(id: basket_ids).to_a

        # @sub_total = 0
        # @basket_products.each{
        #     |i| @sub_total = @sub_total + i[:price] * @basket.find{
        #         |y| y["product_id"] == i[:id]
        #         }.to_h["order_quantity"].to_i
        # @subtotal ||= 0
        # }
    end

    def show
      puts "The session order_id is #{session["order_id"]}"
      
      @order = Order.find(params[:id])
        
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

    def index
        @orders = Order.all

        sql =   "SELECT order_id, SUM(order_quantity) AS number_items
        FROM order_products GROUP BY order_id;"

        @number_items = ActiveRecord::Base.connection.execute(sql)

        puts @number_items.inspect

        @charges = Charge.all

        
    end


    def success
      @charge = Charge.where(stripe_id: params[:id])
      @order = Order.find(@charge[0][:order_id])
      @order_products = OrderProduct.where(order_id: @order.id)
      basket_ids = @order_products.map {|x| x[:product_id]}
      puts basket_ids
      @basket_products = Product.where(id: basket_ids).to_a
     
      puts @order_products.inspect

      @sub_total = 0
      @basket_products.each{
       |i| @sub_total = @sub_total + i[:price] * @order_products.where(
         product_id: i[:id])[0][:order_quantity].to_i
    @subtotal ||= 0
   }
   puts "the subtotal is #{@subtotal}"

   session[:basket] = []

    end

    def fail
    end

    private

    def order_params
      params.require(:order).permit(:user_id, :address, :first_name, :last_name, :email, :phone_number, :total, :text, :comments, :delivery_status)
    end


end



