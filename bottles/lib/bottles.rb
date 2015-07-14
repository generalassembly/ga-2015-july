class Bottles
  def verse(number)
    "#{ number } #{ pluralize "bottle", number } of beer on the wall, #{number} #{ pluralize "bottle", number } of beer.\nTake one down and pass it around, #{ number-1 } #{ pluralize "bottle", number-1 } of beer on the wall.\n"
  end

  private

  def pluralize(word, number)
    if number == 1
      word
    else
      word + "s"
    end
  end
end
