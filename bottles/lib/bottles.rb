class Bottles
  FINAL_BOTTLE_NAME = "no more"

  def verse(bottles)
    @bottles = bottles
    first_verse + last_verse
  end

  def verses(*args)
    args.map { |bottles| verse(bottles) }.join "\n"
  end

  private

  def first_verse
    "#{bottles.to_s.capitalize} #{bottles_pluralized} of beer on the wall, " +
      "#{bottles} #{bottles_pluralized} of beer.\n"
  end

  def last_verse
    @bottles -= 1

    if @bottles < 0
      @bottles = 99
      first_sentence = last_verse_without_bottles_remaining
    else
      first_sentence = last_verse_with_bottles_remaining
    end

    "#{first_sentence}#{bottles} #{bottles_pluralized} of beer on the wall.\n"
  end

  def last_verse_with_bottles_remaining
    "Take #{subject_pluralized} down and pass it around, "
  end

  def last_verse_without_bottles_remaining
    "Go to the store and buy some more, "
  end

  def bottles_pluralized
    bottles == 1 ? "bottle" : "bottles"
  end

  def subject_pluralized
    bottles == FINAL_BOTTLE_NAME ? "it" : "one"
  end

  def bottles
    @bottles == 0 ? FINAL_BOTTLE_NAME : @bottles
  end
end
