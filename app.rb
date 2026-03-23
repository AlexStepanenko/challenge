# frozen_string_literal: true

require "csv"
require_relative "./lib/receipt_generator"
require_relative "./lib/product_classifier"
require_relative "./lib/taxes"
require_relative "./lib/taxes/base"
require_relative "./lib/taxes/basic_sales"
require_relative "./lib/taxes/import_duty"
require_relative "./lib/taxeable"
require_relative "./lib/order"
require_relative "./lib/order_item"
require_relative "./lib/invoice"

class App
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def run
    invoice = ReceiptGenerator.new.call(file_path)
    puts invoice
  end
end
