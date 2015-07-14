class Bottles
  def verses(*numbers)
    numbers.map do |number|
      verse(number)
    end.join("\n")
  end

  def verse(number)
    case number
    when 0
      final_verse
    when 1
      penultimate_verse
    else
      "#{ number } #{ pluralize "bottle", number } of beer on the wall, " +
      "#{number} #{ pluralize "bottle", number } of beer.\n" +
      "Take one down and pass it around, " +
      "#{ number-1 } #{ pluralize "bottle", number-1 } of beer on the wall.\n"
    end
  end

  private

  def penultimate_verse
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  def final_verse
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  end

  def pluralize(word, number)
    if number == 1
      word
    else
      word + "s"
    end
  end
end
