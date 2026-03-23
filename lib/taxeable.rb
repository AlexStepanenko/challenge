# frozen_string_literal: true

module Taxeable
  TAX_TYPES = [
    Taxes::BasicSales,
    Taxes::ImportDuty,
  ]

  def taxes
    total = 0

    TAX_TYPES.each do |tax_type|
      next unless tax_type.appliable?(self)

      total += tax_type.apply(self)
    end

    total
  end
end
