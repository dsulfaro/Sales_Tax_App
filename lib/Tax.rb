require 'byebug'
class Tax

  @@exemptions = []
  @@tax_rate = 0.10
  @@imported_rate = 0.05

  def self.set_all_exemptions(list)
    @@exemptions = list
  end

  def self.add_exemption(item)
    @@exemptions << item
  end

  def self.remove_exemption(item)
    @@exemptions.delete(item)
  end

  def self.is_exempt?(item_name)
    @@exemptions.each { |x| return true if item_name.downcase.include?(x) }
    false
  end

  def self.exemptions
    @@exemptions
  end

  def self.tax_rate
    @@tax_rate
  end

  def self.imported_rate
    @@imported_rate
  end

  def self.set_tax_rate(rate)
    @@tax_rate = rate
  end

  def self.set_imported_rate(rate)
    @@imported_rate = rate
  end

end
