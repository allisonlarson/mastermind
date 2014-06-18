require_relative 'guess'
require_relative 'sequence_matcher'
require_relative 'validator'
require_relative 'guess_printer'
require_relative 'sequence_generator'
require 'pry'


class Mastermind
  # def self.run
  #   new.start
  # end

  attr_accessor :command, :guesses, :current, :answer

  def initialize
    # @command = ''
    @current = ''
    @guesses = []
    @answer = Sequence.new.answer
  end

  def validate_input(input)
    if Validator.length?(input)
      guess(input)
    else
      "Error: Try a different guess."
    end
  end

  def turns
    @guesses.length
  end

  def guess(input)
    @current = Guess.new(input)
    @guesses << @current
    message = sequence_matches
    if message.include?("You are correct")
      @game_over = true
    end
    return message
  end

  def over?
    @game_over
  end

  def history
    @answers = @guesses.map do |e|
      e.sequence.join
    end
  end

  def sequence_matches
    sequence_matcher = SequenceMatcher.new(@answer)
    sequence_matcher.matcher(@current.sequence)
  end
end
