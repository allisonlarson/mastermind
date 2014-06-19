require './lib/mastermind'

class CLI

  attr_reader :game

  def initialize
    @game = Mastermind.new
  end

  def run
    puts
    puts "Let's play Mastermind!".rjust(20)
    puts
    command = ''

    while command != 'q'
      puts
      print "Enter "+"(s)tart".colorize(:green) +", (h)elp".colorize(:yellow) +", or "+"(q)uit".colorize(:red)+":"
      command = gets.chomp
      case command
        when 's' then execute_game
        when 'h' then execute_help
      end
    end
    puts "Thanks for playing!"
    puts
  end

  def execute_game
    while !game.over?
      puts
      print "Enter your guess: "
      input = gets.chomp
      case input
      when 'history' then give_history

      else puts game.validate_input(input)
      end

    end
  end

  def give_history
    puts game.history
    puts
  end

  def execute_help
    puts "Play the damn game, son.".colorize(:cyan)
    puts
  end
end
