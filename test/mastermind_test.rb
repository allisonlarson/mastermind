gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'
require 'pry'

class MastermindTest < Minitest::Test
  def test_it_exsists
    mastermind = Mastermind.new
  end

  def test_how_many_turns_taken
    mastermind = Mastermind.new
    assert_equal 0, mastermind.turns
  end

  def test_turns_have_been_taken
    mastermind = Mastermind.new
    mastermind.beginner_game('rrrr')
    mastermind.beginner_game('bbbb')
    mastermind.beginner_game('yyyy')
    assert_equal 3, mastermind.turns
  end

  def test_track_my_guesses
    mastermind = Mastermind.new
    mastermind.beginner_game('rrrr')
    mastermind.beginner_game('bbbb')
    assert_equal ['RRRR', 'BBBB'], mastermind.history
  end


  def test_validates_input
    mastermind = Mastermind.new
    mastermind.beginner_game('yyyy')
    assert_equal ['Y','Y','Y','Y'], mastermind.current.sequence
  end

  def test_incorrect_input
    mastermind = Mastermind.new
    assert_equal "Error: Try a different guess.".colorize(:red), mastermind.beginner_game('yyy')
  end

  def test_player_can_win_on_the_first_guess
    skip
    mastermind = Mastermind.new
    correct_answer = mastermind.answer.join
    mastermind.beginner_game(correct_answer)
    assert true, mastermind.over?
  end

  def test_beginner_game_option
    mastermind = Mastermind.new
    mastermind.beginner_game('rrrr')
    assert_equal 4, mastermind.answer.length
  end

  def test_intermediate_game_option
    mastermind = Mastermind.new
    mastermind.intermediate_game('bbbbbb')
    assert_equal 6, mastermind.answer.length
  end

  def test_expert_game_option
    mastermind = Mastermind.new
    mastermind.expert_game('cccccccc')
    assert_equal 8, mastermind.answer.length
  end

end
