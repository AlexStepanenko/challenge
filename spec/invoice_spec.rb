# frozen_string_literal: true

require "spec_helper"
require_relative "../lib/receipt_generator"

describe Invoice do
  describe "Receipt generation from inputs" do
    def build_invoice(file_path)
      ReceiptGenerator.new.call(file_path)
    end

    context "for input 1" do
      subject(:invoice) { build_invoice("spec/fixtures/input_1.csv") }

      it "calculates correct total" do
        expect(invoice.total).to eq(4232)
      end

      it "calculates correct tax" do
        expect(invoice.tax_total).to eq(150)
      end

      it "contains correct line items" do
        items = invoice.order.items

        expect(items.size).to eq(3)

        expect(items[0].count).to eq(2)
        expect(items[0].product_name).to eq("book")
        expect(items[0].price_with_tax).to eq(2498)

        expect(items[1].count).to eq(1)
        expect(items[1].product_name).to eq("music CD")
        expect(items[1].price_with_tax).to eq(1649)

        expect(items[2].count).to eq(1)
        expect(items[2].product_name).to eq("chocolate bar")
        expect(items[2].price_with_tax).to eq(85)
      end
    end

    context "for input 2" do
      subject(:invoice) { build_invoice("spec/fixtures/input_2.csv") }

      it "calculates correct total" do
        expect(invoice.total).to eq(6515)
      end

      it "calculates correct tax" do
        expect(invoice.tax_total).to eq(765)
      end

      it "contains correct line items" do
        items = invoice.order.items

        expect(items.size).to eq(2)

        expect(items[0].count).to eq(1)
        expect(items[0].product_name).to eq("imported box of chocolates")
        expect(items[0].price_with_tax).to eq(1050)

        expect(items[1].count).to eq(1)
        expect(items[1].product_name).to eq("imported bottle of perfume")
        expect(items[1].price_with_tax).to eq(5465)
      end
    end

    context "for input 3" do
      subject(:invoice) { build_invoice("spec/fixtures/input_3.csv") }

      it "calculates correct total" do
        expect(invoice.total).to eq(9838)
      end

      it "calculates correct tax" do
        expect(invoice.tax_total).to eq(790)
      end

      it "contains correct line items" do
        items = invoice.order.items

        expect(items.size).to eq(4)

        expect(items[0].count).to eq(1)
        expect(items[0].product_name).to eq("imported bottle of perfume")
        expect(items[0].price_with_tax).to eq(3219)

        expect(items[1].count).to eq(1)
        expect(items[1].product_name).to eq("bottle of perfume")
        expect(items[1].price_with_tax).to eq(2089)

        expect(items[2].count).to eq(1)
        expect(items[2].product_name).to eq("packet of headache pills")
        expect(items[2].price_with_tax).to eq(975)

        expect(items[3].count).to eq(3)
        expect(items[3].product_name).to eq("imported boxes of chocolates")
        expect(items[3].price_with_tax).to eq(3555)
      end
    end
  end
end
