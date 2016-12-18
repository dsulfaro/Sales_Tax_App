
class ShoppingCart

  def initialize
    @cart = []
  end

  def checkout

  end

  def <<(item)
    @cart << item
  end

  def add(item)
    self << item
  end

  
end
