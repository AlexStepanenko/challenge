# frozen_string_literal: true

class Taxes::BasicSales < Taxes::Base
  TAXEABLE_CATEGORIES = [
    :books,
    :food,
    :medical,
  ]

  TAX_RATE = 0.10

  class << self
    def appliable?(taxeable)
      TAXEABLE_CATEGORIES.none? do |taxeable_category|
        taxeable_category == taxeable.product_category
      end
    end
  end
end
