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

  def test_guess_matches_sequence
    skip
    mastermind = Mastermind.new
    mastermind.guess('rrrr')
    assert_equal true, mastermind.sequence_matches?
  end

  def test_guess_does_not_match_sequence
    skip
    mastermind = Mastermind.new
    mastermind.guess('rrrr')
    assert_equal false, mastermind.sequence_matches?
  end

  def test_validates_input
    mastermind = Mastermind.new
    assert_equal ['Y','Y','Y','Y'], mastermind.validate_input('yyyy')

  def test_incorrect_input
    mastermind = Mastermind.new
    assert_equal "Error: Try a different guess.", mastermind.validate_input('yyy')
end
