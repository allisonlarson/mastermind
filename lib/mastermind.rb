require_relative 'guess'
require_relative 'sequence_matcher'
require_relative 'validator'
require_relative 'guess_printer'
require_relative 'sequence_generator'
require 'colorize'


class Mastermind

  attr_accessor :command, :guesses, :current, :answer

  def initialize
    @current = ''
    @guesses = []
    @answer = Sequence.new.answer
  end

  def validate_input(input)
    if Validator.length?(input)
      guess(input)
    else
      "Error: Try a different guess.".colorize(:red)
    end
  end

  def turns
    @guesses.length
  end

  def guess(input)
    @current = Guess.new(input)
    @guesses << @current
    message = game_message
    if @sequence_matcher.clues["correct_positions"] == 4
      @game_over = true
    end
    puts message
    puts GuessPrinter.taken_turns(turns)

  end

  def over?
    @game_over

  end

  def history
    @answers = @guesses.map do |e|
      e.sequence.join
    end
  end

  def early_quit
    @game_over = true
    "Too tough for you?"
  end

  def sequence_matches
    @sequence_matcher = SequenceMatcher.new(@answer)
    @sequence_matcher.matcher(@current.sequence)
  end

  def game_message
    sequence_matches
    if @sequence_matcher.clues["correct_positions"] == 4
      GuessPrinter.win_message(@guesses[0])
    elsif @sequence_matcher.clues["correct_positions"] > 0 or @sequence_matcher.clues["correct_letters"] > 0
      GuessPrinter.correct_position_message(@sequence_matcher.clues["correct_positions"], @sequence_matcher.clues["correct_letters"])
    else
      GuessPrinter.incorrect_message
    end
  end
end
