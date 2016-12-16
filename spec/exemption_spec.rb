require 'rspec'
require_relative '../lib/Exemption'

describe Exemption do

 list = ["book", "chocolate"]
 Exemption.set_all_exemptions(list)

 describe '::set_all_exemptions' do
   it 'correctly sets the list of exemptions with an array as input' do
     expect(Exemption.exemptions).to eq(["book", "chocolate"])
   end
 end

 describe '::add_exemption' do
   it 'adds an exemption to the list' do
     Exemption.add_exemption('medicine')
     Exemption.add_exemption('sunglasses')
     expect(Exemption.exemptions.include?('medicine')).to be(true)
     expect(Exemption.exemptions.include?('sunglasses')).to be(true)
   end
 end

 describe '::remove_exemption' do
   it 'removes an exemption from the list' do
     Exemption.remove_exemption('sunglasses')
     list << 'medicine'
     expect(Exemption.exemptions.include?('sunglasses')).to be(false)
     expect(Exemption.exemptions).to equal(list)
   end
 end

 describe 'is_exempt?' do
   it 'takes in an item and checks the item string against each item in the exemptions list' do
     expect(Exemption.is_exempt?("book")).to be(true)
     expect(Exemption.is_exempt?("books")).to be(true)
     expect(Exemption.is_exempt?("The Book of Lies")).to be(true)
     expect(Exemption.is_exempt?("flowers")).to be(false)
     expect(Exemption.is_exempt?("chocolate bar")).to be(true)
     expect(Exemption.is_exempt?("sunglasses")).to be(false)
   end
 end


end
