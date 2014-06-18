require_relative 'guess_printer'
require_relative 'sequence_generator'
require 'pry'

class SequenceMatcher

  attr_accessor :answer, :count, :count_one

  def initialize
    # @answer = answer
    @answer ||= Sequence.new.answer
    @count  = 0
    @count_one = 0
  end

  def matcher(guess)
    correct_position(guess)
    correct_letters(guess)
    if win?(guess)
      GuessPrinter.win_message
    elsif @count > 0 or @count_one > 0
      print_clues
    else
      lose?
    end
  end

  def win?(guess)
    answer == guess
  end

  def correct_position(guess)
    answer.each_with_index do |char, i|
      @count += 1 if char == guess[i]
    end
  end

  def correct_letters(guess)
    letters = answer.map {|letter| letter if guess.include?(letter)}
    @count_one = letters.join.length
    @count_one -= @count
  end

  def lose?
    lose = false
    if @count && @count_one == 0
      lose = true
      GuessPrinter.incorrect_message
    end
  end

  def print_clues
    GuessPrinter.correct_position_message(count)+ " " +GuessPrinter.correct_color_message(count_one)
  end
end
