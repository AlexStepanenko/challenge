# frozen_string_literal: true

class Taxes::ImportDuty < Taxes::Base
  IMPORTED = "imported"
  TAX_RATE = 0.05

  class << self
    def appliable?(taxeable)
      taxeable.product_name.downcase.include?(IMPORTED)
    end
  end
end
