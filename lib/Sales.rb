require_relative 'Item'

class Sales

  def self.run
    prompt
    file = Sales.get_path
    File.open(file) do |file|
      file.each_line do |line|
        Sales.parse(line)
      end
    end
  end

  def self.parse(line)

    at = line.index(' at ')
    name = line.slice(2, at - 2)
    price = (line.slice(at + 3, line.length - (at + 1))).to_f
    item = Item.new(name, price)
  end

  def self.prompt
    puts "Enter a filename"
  end

  def self.get_path
    file = gets.chomp
    "input/#{file}"
  end

end

Sales.run
