class GuessPrinter
  def self.win_message
    "You are correct!"
  end

  def self.incorrect_message
    "No common colors or positions."
  end

  def self.correct_position_message(method)
    "You have #{method} colors in correct position."
  end

  def self.correct_color_message(method)
    "You have #{method} colors in incorrect positions."
  end

  def self.taken_turns(turns)
    "You have taken #{turns} turn(s)."
  end

end
