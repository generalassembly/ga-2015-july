class Fixnum
  def to_bottle_number

    (BottleNumber.descendants.keep_if { |klass|
      klass::POSITION == self
    }.first || BottleNumber).new(self)

    # case self
    # when 0
    #   ZeroBottles
    # when 1
    #   OneBottleLeft
    # else
    #   BottleNumber
    # end.new(self)
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
    "#{bottle_number.to_s.capitalize} of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_reader :number

  def self.descendants
    ObjectSpace.each_object(Class).select do |klass|
      klass < self
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
    (number - 1).to_bottle_number
  end

  def to_s
    "#{amount} #{container}"
  end
end

class ZeroBottles < BottleNumber
  POSITION = 0.freeze

  def amount
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    99.to_bottle_number
  end
end

class OneBottleLeft < BottleNumber
  POSITION = 1.freeze

  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
