class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil?
      @cart = current_user.carts.create
      current_user.current_cart = @cart
    end
    current_user.current_cart.line_items << LineItem.find_or_create_by(item_id: params[:item_id])
  end

end
