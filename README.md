# Sales Tax Receipt

A Ruby program that reads shopping baskets and prints receipts with correct sales tax.

## How to run

You can run the program like this:
```bash
ruby -r ./app -e "App.new('spec/fixtures/input_1.csv').run"
ruby -r ./app -e "App.new('spec/fixtures/input_2.csv').run"
ruby -r ./app -e "App.new('spec/fixtures/input_3.csv').run"
```

## What it does

- Reads items from a CSV file
- Calculates 10% sales tax and 5% import duty
- Books, food and medical products are exempt from 10% tax
- Prints a nice receipt with totals

## Project structure

- app.rb — main file
- lib/ — all application code
- spec/fixtures/ — test input files
