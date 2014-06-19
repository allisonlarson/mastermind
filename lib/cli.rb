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
      when 's' then execute_difficulty_level
      when 'h' then execute_help
      end
    end
    puts "*******************Thanks for playing!*******************"
    puts
  end


  def execute_difficulty_level
    puts
    print "Are you a "+"(b)eginner".colorize(:green)+", "+"(i)ntermediate".colorize(:yellow)+", or"+"(e)xpert".colorize(:red)+"?"
    input = gets.chomp
    case input
    when 'b' then execute_beginner
    when 'i' then execute_intermediate
    when 'e' then execute_expert
    end
  end

  def execute_beginner
    game.start_new
    while !game.over?
      puts
      print "Enter your guess: "
      input = gets.chomp
      case input
      when 'history' then give_history
      when 'quit'    then early_quit
      else puts game.beginner_game(input)
      end
    end
  end

  def execute_intermediate
    game.start_new
    while !game.over?
      puts
      print "Enter your guess: "
      input = gets.chomp
      case input
      when 'history' then give_history
      when 'quit'    then early_quit
      else puts game.intermediate_game(input)
      end
    end
  end

  def execute_expert
    game.start_new
    while !game.over?
      puts
      print "Enter your guess: "
      input = gets.chomp
      case input
      when 'history' then give_history
      when 'quit'    then early_quit
      else puts game.expert_game(input)
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
    puts "     Beginner plays with 4 colors and 4 open positions.
     Intermediate plays with 5 colors and 6 open positions.
     Expert plays with 6 colors and 8 open positions.
     Enter "+"(b)lue".colorize(:blue)+", "+"(g)reen".colorize(:green)+", "+"(y)ellow".colorize(:yellow)+", "+"(r)ed".colorize(:red)+", "+"(c)yan".colorize(:cyan)+", and/or "+"(m)agenta".colorize(:magenta)+"
     to guess the sequence.
     If it's too hard, just quit. We can't all be masterminds.

     Play the damn game, son."
    puts
  end
end
