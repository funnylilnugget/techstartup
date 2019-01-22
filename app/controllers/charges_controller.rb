class ChargesController < ApplicationController

  def new

    @sub_total = 500
    @amount_dollar = @sub_total * (0.01)
    @tax = @amount_dollar * (0.08875)
    @total = (@amount_dollar + @tax)

  end

  def create
  # Amount in cents
  @amount = 545

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  @user = User.find(session[:user_id])
  @user.premium = true
  @user.save
  flash[:notice] = "Thank You #{@user.first_name.capitalize}! You are now a Premium Member"
  redirect_to user_path(session[:user_id])

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
