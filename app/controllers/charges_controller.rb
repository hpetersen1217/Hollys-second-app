class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = 500
    token = params[:stripeToken]

    charge = Stripe::Charge.create(
      :card => token,
      :amount => @amount,
      :description => 'Rails Stripe customer',
      :currency => 'usd')

    current_user.paid = true
    current_user.save

    redirect_to root_path
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
