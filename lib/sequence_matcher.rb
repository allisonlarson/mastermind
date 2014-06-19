require_relative 'guess_printer'
require_relative 'sequence_generator'
require 'pry'

class SequenceMatcher

  attr_accessor :positions, :colors, :clues

  def initialize(answer)
    @answer = answer
    @positions  = 0
    @colors = 0
    @clues = {}
  end

  def correct_position(guess)
    @answer.each_with_index do |char, i|
      @positions += 1 if char == guess[i]
    end
    @colors -= @positions
  end

  def correct_letters(guess)
    letters = @answer.map {|letter| letter if guess.include?(letter)}
    @colors = letters.join.length

  end

  def matcher(guess)
    correct_letters(guess)
    correct_position(guess)
    @clues = {
      "correct_positions" => positions,
      "correct_letters" => colors,
    }
  end

end
