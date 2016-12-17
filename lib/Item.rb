require_relative 'Exemption'

class Item

  attr_reader :name, :price, :tax_rate, :exempt, :imported

  def initialize(name, price)
    @name, @price = name, price
    @tax_rate = 0
  end

  def final_price
    @price + (@price * @tax_rate)
  end

  private

  def set_tax_rate
    @tax_rate += 0.10 unless Exemption.is_exempt?(@name)
    @tax_rate += 0.05 if @name.downcase.include?('import')
  end

end
