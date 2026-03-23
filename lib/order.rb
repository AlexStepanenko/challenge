# frozen_string_literal: true

class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(order_item)
    @items.push(order_item)
  end
end
