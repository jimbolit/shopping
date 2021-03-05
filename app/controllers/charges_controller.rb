class ChargesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create_checkout_session
    Stripe.api_key = "sk_test_51CA2ZeBxFUzJnIkKk2w3azptcxGODrRabvEulywcWzRNbagiP1tjlvIt63sHOA7hiowH1mCDv9jOob2xL6lcQqAi00zSf6xgcL"
   
    charge = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'nzd',
          product_data: {
            name: 'Shopalong cart',
            images: ['https://i.imgur.com/EHyR2nP.png'],
          },
          unit_amount: 2000,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      success_url: 'http://localhost:3000/orders/success/{CHECKOUT_SESSION_ID}',
      cancel_url: 'http://localhost:3000/orders/fail',
    })

    charge_details = JSON.parse charge.to_s
    @order = Order.find(session[:order_id])
    @charge = @order.create_charge(stripe_id: charge_details["id"], status: "pending")
    @charge.save!
    puts "THIS WOOOOOOOOOOORKEDDDD #{@charge.inspect}"    

    render json: charge
  end

  def webhook
      endpoint_secret = 'whsec_lzbZ892uPjj6w4u8DmeB2yOdBmMDTzMa'
      event = nil
        # Verify webhook signature and extract the event
        # See https://stripe.com/docs/webhooks/signatures for more information.
        begin
          sig_header = request.env['HTTP_STRIPE_SIGNATURE']
          payload = request.body.read
          event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
        rescue JSON::ParserError => e
          # Invalid payload
          return status 400
        rescue Stripe::SignatureVerificationError => e
          # Invalid signature
          return status 400
        end

        if event['type'] == 'checkout.session.completed'
          checkout_session = event['data']['object']

          fulfill_order(checkout_session)
        end

      end

      def fulfill_order(checkout_session)
        # I can't figure out how to have session variable come through
       
        puts "The session order_id issssssssssssssss"
        puts session[:order_id].inspect
        # @order = Order.find(session["order_id"])
        # @charge = @order.charges.new(stripe_id: checkout_session['id'], status: "paid")
        # @charge.save!
        # puts "THIS WOOOOOOOOOOORKEDDDD #{@charge.inspect}"

        # puts "Fulfilling order for #{checkout_session.inspect}"

      end


end
