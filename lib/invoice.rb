# frozen_string_literal: true

class Invoice
  attr_reader :order, :tax_total, :total

  def initialize(order)
    @order = order
    @tax_total = 0
    @total = 0
  end

  def from_order
    order.items.each do |order_item|
      @tax_total += order_item.tax_total
      @total += order_item.price_with_tax
    end

    self
  end

  def to_s
    output = []

    order.items.each do |order_item|
      output << "#{order_item.count} #{order_item.product_name}: #{format_price(order_item.price_with_tax)}\n"
    end

    output << "Sales Taxes: #{format_price(tax_total)}\n"
    output << "Total: #{format_price(total)}"
    output.join
  end

  alias inspect to_s

  def format_price(price_cents)
    format("%.2f", price_cents / 100.0)
  end
end
