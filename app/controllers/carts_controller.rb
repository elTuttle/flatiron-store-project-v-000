class CartsController < ApplicationController

  def show
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.line_items.each do |line_items|
      line_items.item.inventory -= line_items.quantity
      line_items.item.save
    end
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@cart)
  end

end
