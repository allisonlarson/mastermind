class GuessPrinter
  def self.win_message(guess)
    time = (Time.now - guess.created_at).round
    puts "You are correct!".colorize(:green)
    puts "You completed the puzzle in #{time} seconds!"
  end

  def self.incorrect_message
    "No correct colors or positions.".colorize(:red)
  end

  def self.correct_position_message(positions, colors)
    "You have "+"#{positions}".colorize(:yellow)+" color(s) in the "+"correct".colorize(:green)+ " positions, and "+"#{colors}".colorize(:yellow)+" color(s) in" +" incorrect".colorize(:red)+" positions"
  end

  def self.taken_turns(turns)
    "You have taken #{turns} turn(s).".colorize(:yellow)
  end

end
