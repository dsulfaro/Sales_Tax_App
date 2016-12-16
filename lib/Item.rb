require_relative 'Exemption'

class Item

  attr_reader :name, :price, :tax_rate, :exempt, :imported

  def initialize(name, price)
    @name, @price = name, price
  end

  private

  def set_tax_rate
    @tax_rate = 10;
  end

end
