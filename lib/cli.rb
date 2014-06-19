require './lib/mastermind'

class CLI

  attr_reader :game

  def initialize
    @game = Mastermind.new
  end

  def run
    puts
    puts "*****************Let's play Mastermind!*****************"
    puts
    command = ''

    while command != ('q')
      puts
      print "Enter "+"(s)tart".colorize(:green) +", (h)elp".colorize(:yellow) +", or "+"(q)uit".colorize(:red)+":"
      command = gets.chomp
      case command
        when 's' then execute_game
        when 'h' then execute_help
      end
    end
    puts "*******************Thanks for playing!*******************"
    puts
  end

  def execute_game
    while !game.over?
      puts
      print "Enter your guess: "
      input = gets.chomp
      case input
      when 'history' then give_history
      when 'quit' then early_quit
      else puts game.validate_input(input)
      end
    end
  end

  def give_history
    puts game.history
    puts
  end

  def early_quit
    puts game.early_quit
    puts
  end

  def execute_help
    puts
    puts "Play the damn game, son.
     Enter "+"(b)lue".colorize(:blue)+", "+"(g)reen".colorize(:green)+", "+"(y)ellow".colorize(:yellow)+", and/or "+"(r)ed".colorize(:red)+" to guess the sequence.
     If it's too hard, just quit. We can't all be masterminds."
    puts
  end
end
