gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'

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
    mastermind.guess('rrrr')
    mastermind.guess('bbbb')
    mastermind.guess('yyyy')
    assert_equal 3, mastermind.turns
  end

  def test_track_my_guesses
    mastermind = Mastermind.new
    mastermind.guess('rrrr')
    mastermind.guess('bbbb')
    assert_equal ['RRRR', 'BBBB'], mastermind.history
  end

  def test_that_the_guess_is_checked_by_the_matcher
    mastermind = Mastermind.new
    mastermind.guess('rrrr')
    assert mastermind.sequence_matches.include?("positions.")
  end

  def test_validates_input
    mastermind = Mastermind.new
    mastermind.validate_input('yyyy')
    assert_equal ['Y','Y','Y','Y'], mastermind.current.sequence
  end

  def test_incorrect_input
    mastermind = Mastermind.new
    assert_equal "Error: Try a different guess.", mastermind.validate_input('yyy')
  end

  def test_player_can_win_on_the_first_guess
    mastermind = Mastermind.new
    correct_answer = mastermind.answer.join
    result = mastermind.guess(correct_answer)
    assert result.include?("correct")
  end
end
