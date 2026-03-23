# frozen_string_literal: true

require "csv"
require_relative "product_classifier"
require_relative "taxes"
require_relative "taxes/base"
require_relative "taxes/basic_sales"
require_relative "taxes/import_duty"
require_relative "taxeable"
require_relative "order"
require_relative "order_item"
require_relative "invoice"

class ReceiptGenerator
  def call(file_path)
    order = Order.new

    CSV.foreach(file_path) do |row,|
      count, product_name, price = parse_row(row)
      product_category = ProductClassifier.new(product_name).classify
      order_item = OrderItem.new(count, product_name, price, product_category)
      order.add_item(order_item)
    end

    Invoice.new(order).from_order
  end

  def parse_row(row)
    parts = row.split(" at ")

    name_and_count = parts[0]
    price = parts[1]

    count, *name_parts = name_and_count.split
    product_name = name_parts.join(" ")

    [
      count.to_i,
      product_name,
      to_cents(price),
    ]
  end

  def to_cents(price_string)
    return 0 unless price_string

    price, cents = price_string.to_s.strip.split(".")

    price = price.to_i
    cents = cents.to_s.ljust(2, "0")[0, 2].to_i

    price * 100 + cents
  end
end
