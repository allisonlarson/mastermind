require_relative 'guess_printer'
require 'pry'

class SequenceMatcher

  attr_reader :answer

  def initialize(answer)
    @answer = answer
    # @answer ||= Sequence.new.answer
    @count  = 0
  end

  def matcher(guess)
    correct_position(guess)
    correct_letters(guess)
    lose win?(guess)
  end

  def win?(guess)
    if answer == guess
      GuessPrinter.win_message
    end
  end

  def correct_position(guess)
    answer.each_with_index do |char, i|
      @count += 1 if char == guess[i]
    end
    if @count > 0
      GuessPrinter.correct_position_message(@count)
    end
    # i = 0
    # @count = 0
    # 4.times do
    #   if answer[i] == guess[i]
    #     @count += 1
    #   end
    #   i += 1
    # end
    # @count
  end

  def correct_letters(guess)
    letters = answer.map {|letter| letter if guess.include?(letter)}
    @count_one = letters.join.length
    if @count_one > 0
      GuessPrinter.correct_color_message(@count_one)
    end
  end

  def lose
    if @count && @count_one == 0
      GuessPrinter.incorrect_message
    end
  end
end
