# frozen_string_literal: true

require_relative "lib/receipt_generator"

file_path = ARGV[0]

unless file_path
  puts "Example: ruby app.rb spec/fixtures/input_1.csv"
  exit 1
end

invoice = ReceiptGenerator.new.call(file_path)
puts invoice
