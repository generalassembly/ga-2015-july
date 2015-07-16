class Fixnum
  def to_bottle_number
    begin
      Object.const_get("BottleNumber#{self}")
    rescue
      BottleNumber
    end.new(self)
  end
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = number.to_bottle_number

    "#{bottle_number.amount.capitalize} #{bottle_number.container} of beer on the wall, " +
    "#{bottle_number.amount} #{bottle_number.container} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor.amount} #{bottle_number.successor.container} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.for(number)
    case number
    when 0
      BottleNumber0.new(number)
    when 1
      BottleNumber1.new(number)
    when 6
      BottleNumber6.new(number)
    else
      BottleNumber.new(number)
    end
  end

  def initialize(number)
    @number = number
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def amount
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

class BottleNumber0 < BottleNumber
  def amount
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

class BottleNumber6 < BottleNumber
  def amount
    "one"
  end

  def container
    "six pack"
  end
end
