require_relative 'Tax'

class Item

  attr_reader :name, :price, :tax_rate

  def initialize(name, price)
    @name, @price = name, price
    @tax_rate = 0
    self.set_tax_rate
  end

  def set_tax_rate
    @tax_rate += Tax.tax_rate unless Tax.is_exempt?(@name)
    @tax_rate += Tax.imported_rate if @name.include?('import')
    @tax_rate = @tax_rate.round(2)
  end

end
