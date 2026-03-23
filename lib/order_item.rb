# frozen_string_literal: true

class OrderItem
  include Taxeable

  attr_reader :count, :product_name, :price, :product_category

  def initialize(count, product_name, price, product_category)
    @count = count
    @product_name = product_name
    @price = price
    @product_category = product_category
  end

  def price_with_tax
    @price_with_tax ||= count * price + tax_total
  end

  def tax_total
    @tax_total ||= count * taxes
  end
end
