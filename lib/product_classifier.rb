# frozen_string_literal: true

class ProductClassifier
  attr_reader :product_name

  def initialize(product_name)
    @product_name = product_name
  end

  def classify
    case product_name
    when /book/
      :books
    when /pill/
      :medical
    when /chocolate/
      :food
    else
      :other
    end
  end
end
