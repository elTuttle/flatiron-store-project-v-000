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

  def add_item(new_item)


  end

end
