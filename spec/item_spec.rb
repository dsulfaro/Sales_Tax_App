require 'rspec'
require_relative '../lib/Item'

describe Item do

  describe 'initialize' do
    it 'takes in a name and price and saves values to ivars' do
      shirt = Item.new('shirt', 15.50)
      expect(shirt.name).to eq('shirt')
      expect(shirt.price).to eq(15.50)
    end
  end

  describe '#set_tax_rate' do
    it 'appropriately sets tax rates for items -- saved as an ivar' do

      # clothes are taxed at standard 10%
      socks = Item.new('socks', 5.00)
      expect(socks.tax_rate).to eq(0.10)

      # imported clothes are taxed at 15%
      imported_socks = Item.new('imported socks', 10.00)
      expect(imported_socks.tax_rate).to eq(0.15)

      # books are exempt
      book = Item.new("A Book Of Lies", 7.99)
      expect(book.tax_rate).to eq(0.0)

      # imported book is taxed but only slightly
      imported_book = Item.new("an imported book from Portugal", 18.99)
      expect(imported_book.tax_rate).to eq(0.05)

    end
  end
end
