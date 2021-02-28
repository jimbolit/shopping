class ChargesController < ApplicationController


  def create_checkout_session
    Stripe.api_key = "sk_test_51CA2ZeBxFUzJnIkKk2w3azptcxGODrRabvEulywcWzRNbagiP1tjlvIt63sHOA7hiowH1mCDv9jOob2xL6lcQqAi00zSf6xgcL"
  
   
    session = Stripe::Checkout::Session.create({
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
      success_url: 'http://localhost:3000/orders/success',
      cancel_url: 'http://localhost:3000/orders/fail',
    })

    { id: session.id }.to_json

    render json: session

  end

end
