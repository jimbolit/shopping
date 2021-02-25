class ChargesController < ApplicationController


  def create_checkout_session

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'T-shirt',
          },
          unit_amount: 2000,
        },
        quantity: 1,
      }],
      mode: 'payment',
      # These placeholder URLs will be replaced in a following step.
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
    })

    { id: session.id }.to_json

  end

end
