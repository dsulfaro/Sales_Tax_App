require 'rspec'
require_relative '../lib/Tax'

describe Tax do

 list = ["book", "chocolate"]
Tax.set_all_exemptions(list)

 describe '::set_all_exemptions' do
   it 'correctly sets the list of exemptions with an array as input' do
     expect(Tax.exemptions).to eq(["book", "chocolate"])
   end
 end

 describe '::add_exemption' do
   it 'adds an exemption to the list' do
    Tax.add_exemption('medicine')
    Tax.add_exemption('sunglasses')
     expect(Tax.exemptions.include?('medicine')).to be(true)
     expect(Tax.exemptions.include?('sunglasses')).to be(true)
   end
 end

 describe '::remove_exemption' do
   it 'removes an exemption from the list' do
    Tax.remove_exemption('sunglasses')
     list << 'medicine'
     expect(Tax.exemptions.include?('sunglasses')).to be(false)
     expect(Tax.exemptions).to equal(list)
   end
 end

 describe 'is_exempt?' do
   it 'takes in an item and checks the item string against each item in the exemptions list' do
     expect(Tax.is_exempt?("book")).to be(true)
     expect(Tax.is_exempt?("books")).to be(true)
     expect(Tax.is_exempt?("The Book of Lies")).to be(true)
     expect(Tax.is_exempt?("flowers")).to be(false)
     expect(Tax.is_exempt?("chocolate bar")).to be(true)
     expect(Tax.is_exempt?("sunglasses")).to be(false)
   end
 end


end
