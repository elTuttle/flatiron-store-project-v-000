class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    price = 0
    self.items.each do |item|
      price += item.price
    end
    price
  end

  def add_item(item_id)
    if self.line_items.find_by(item_id: item_id)
      temp_item = self.line_items.find_by(item_id: item_id)
      #binding.pry
      temp_item.update(quantity: temp_item.quantity + 1)
      temp_item
    else
      LineItem.new(item_id: item_id, cart_id: self.id, quantity: 1)
    end

  end

end
