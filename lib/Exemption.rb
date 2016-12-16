require 'byebug'
class Exemption

  @@exemptions = []

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

end
