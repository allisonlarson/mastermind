require './lib/mastermind'

class CLI

  attr_reader :game

  def initialize
    @game = Mastermind.new
  end

  def run
    puts "Let's play Mastermind!"
    command = ''

    while command != 'q'
      print "Enter (s)tart, (h)elp, or (q)uit: "
      command = gets.chomp
      case command
        when 's' then execute_game
        when 'h' then execute_help
      end
    end
    puts "Thanks for playing!"
  end

  def execute_game
    while !game.over?
      print "Enter your guess: "
      input = gets.chomp
      puts game.validate_input(input)

    end
  end

  def execute_help
    puts "Play the damn game, son."
  end
end
