# frozen_string_literal: true

class Taxes::Base
  class << self
    def apply(taxeable)
      round_up(taxeable.price * self::TAX_RATE)
    end

    def round_up(number)
      (number / 5.0).ceil * 5
    end
  end
end
