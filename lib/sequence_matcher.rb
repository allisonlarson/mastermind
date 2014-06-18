require_relative 'guess_printer'
require 'pry'

class SequenceMatcher

  attr_reader :answer, :count, :count_one

  def initialize(answer)
    @answer = answer
    # @answer ||= Sequence.new.answer
    @count  = 0
    @count_one = 0
  end
  # 
  # def matcher(guess)
  #   if win?(guess)
  #   elsif lose
  #   end
  # end

  def win?(guess)
    if answer == guess
      GuessPrinter.win_message
    end
  end

  def correct_position(guess)
    answer.each_with_index do |char, i|
      @count += 1 if char == guess[i]
    end
    # if @count > 0
    #   GuessPrinter.correct_position_message(@count)
    # end
  end

  def correct_letters(guess)
    letters = answer.map {|letter| letter if guess.include?(letter)}
    @count_one = letters.join.length
    @count_one -= @count
  end
    # if @count_one > 0
    #   GuessPrinter.correct_color_message(@count_one)
    # end

  def lose
    if @count && @count_one == 0
      GuessPrinter.incorrect_message
    end
  end

  def print_clues
    if @count > 0 or @count_one > 0
      GuessPrinter.correct_position_message(count)+ " " +GuessPrinter.correct_color_message(count_one)
    end
  end
end
