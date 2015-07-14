class Bottles
  def verse(number)
    return penultimate_verse if number == 1

    "#{ number } #{ pluralize "bottle", number } of beer on the wall, #{number} #{ pluralize "bottle", number } of beer.\nTake one down and pass it around, #{ number-1 } #{ pluralize "bottle", number-1 } of beer on the wall.\n"
  end

  private

  def penultimate_verse
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  end

  def pluralize(word, number)
    if number == 1
      word
    else
      word + "s"
    end
  end
end
