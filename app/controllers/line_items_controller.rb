class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil?
      @cart = current_user.carts.create
      current_user.current_cart = @cart
    end

    current_user.current_cart.line_items << LineItem.find_or_create_by(item_id: params[:item_id], cart_id: current_user.current_cart.id)
    #binding.pry
    li = current_user.current_cart.line_items.find_by(item_id: params[:item_id])
    if li.quantity.nil?
      li.quantity = 1
    else
      li.quantity += 1
    end
    li.save
    current_user.current_cart.save
    current_user.save

    redirect_to cart_path(current_user.current_cart)
  end

end
