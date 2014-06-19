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
    @answer = nil
  end

  def beginner_game(input)
    @answer ||= Sequence.new.beginner
    validate_input(input, 4)
  end

  def intermediate_game(input)
    @answer ||= Sequence.new.intermediate
    validate_input(input, 6)
  end

  def expert_game(input)
    @answer ||= Sequence.new.expert
    validate_input(input, 8)
  end

  def validate_input(input, number)
    if Validator.length?(input, number)
      guess(input, number)
    else
      "Error: Try a different guess.".colorize(:red)
    end
  end

  def guess(input, number)
    @current = Guess.new(input)
    @guesses << @current
    message = game_message(number)
    if @sequence_matcher.clues["correct_positions"] == number
      @game_over = true
    end
    puts message
    puts GuessPrinter.taken_turns(turns)
  end

  def game_message(number)
    sequence_matches
    if @sequence_matcher.clues["correct_positions"] == number
      GuessPrinter.win_message(@guesses[0])
    elsif @sequence_matcher.clues["correct_positions"] > 0 or @sequence_matcher.clues["correct_letters"] > 0
      GuessPrinter.correct_position_message(@sequence_matcher.clues["correct_positions"], @sequence_matcher.clues["correct_letters"])
    else
      GuessPrinter.incorrect_message
    end
  end

  def sequence_matches
    @sequence_matcher = SequenceMatcher.new(@answer)
    @sequence_matcher.matcher(@current.sequence)
  end

  def over?
    @game_over
  end

  def start_new
    @game_over = false
    @guesses = []
    @answer = nil
  end

  def history
    @answers = @guesses.map do |e|
      e.sequence.join
    end
  end

  def turns
    @guesses.length
  end

  def early_quit
    @game_over = true
    "Too tough for you?"
  end

end
