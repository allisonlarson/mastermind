require_relative 'guess'
require_relative 'sequence_matcher'
require_relative 'validator'
require 'pry'


class Mastermind
  def self.run
    new.start
  end

  attr_accessor :command, :guesses, :current

  def initialize
    @command = ''
    @current = ''
    @guesses = []
  end

  # def start
  #   puts "Let's play Mastermind!"
  #   while command != 'q'
  #     print "Enter (s)tart, (h)elp, or (q)uit: "
  #     command = gets.chomp
  #       case command
  #       when 's' then execute_game
  #       when 'h' then execute_help
  #       end
  #
  #     end
  #   end
  #   puts "Thanks for playing!"
  # end


  def execute_game
    while command != 'q'
      print "Enter your guess: "
      input = gets.chomp
      validate_input(input)
      sequence_matches
    end
  end

  def validate_input(input)
    binding.pry
    if Validator.length?(input)
      guess(input)
    else
      puts "Error: Try a different guess."
    end
  end

  def turns
    @guesses.length
  end

  def guess(input)
    @current = Guess.new(input)
    @guesses << @current
  end

  def history
    @answers = @guesses.map do |e|
      e.sequence.join
    end
  end

  def sequence_matches(guess)
    sequence_matcher = SequenceMatcher.new
    sequence.matcher.match(guess.sequence)
  end

end
