gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_matcher'
require_relative '../lib/sequence_generator'
require_relative '../lib/guess'
require 'pry'

class SequenceMatcherTest < Minitest::Test
  def test_it_has_a_sequence
    sequence_matcher = SequenceMatcher.new(['R', 'R', 'R', 'G'])
    assert_equal true, sequence_matcher.respond_to?(:answer)
  end

  def test_it_matches_guess_and_sequence
    sequence_matcher = SequenceMatcher.new(['R', 'Y', 'B', 'G'])
    guess = Guess.new('rybg')
    assert_equal "You are correct!", sequence_matcher.win?(guess.sequence)
  end

  def test_it_alerts_when_correct_letters_are_used
    sequence_matcher = SequenceMatcher.new(['Y', 'G', 'B', 'R'])
    guess = Guess.new('ggbr')
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal 3, sequence_matcher.count_one
  end

  def test_it_does_not_alert_when_no_letters_are_used
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
    guess = Guess.new('rrrr')
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal 0, sequence_matcher.count_one
  end

  def test_it_alerts_when_correct_positions_are_found
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'R', 'G'])
    guess = Guess.new('yyyy')
    sequence_matcher.correct_position(guess.sequence)
    assert_equal 2, sequence_matcher.count
  end

  def test_it_does_not_alert_when_no_positions_found
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B'])
    guess = Guess.new('bgry')
    sequence_matcher.correct_position(guess.sequence)
    assert_equal 0, sequence_matcher.count
  end

  def test_no_common_elements
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
    guess = Guess.new('gggg')
    sequence_matcher.correct_position(guess.sequence)
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal "No common colors or positions.", sequence_matcher.lose
  end

  def test_print_clues
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B'])
    guess = Guess.new('ygrb')
    sequence_matcher.correct_position(guess.sequence)
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal "You have 2 correct positions. You have 2 correct colors in incorrect positions.", sequence_matcher.print_clues
  end

  def test_runs_the_matcher_and_wins
    skip
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
    guess = Guess.new('yyyy')
    assert_equal "You are correct!", sequence_matcher.matcher(guess.sequence)
  end

  def test_runs_matcher_and_has_correct_letters_and_positions
    skip
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'R', 'G'])
    guess = Guess.new('yygr')
    assert_equal "You have 2 correct positions. You have 3 correct colors in incorrect positions.", sequence_matcher.matcher(guess.sequence)
  end

  def test_runs_matcher_and_loses
    skip
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
    guess = Guess.new('rrrr')
    assert_equal "No common colors or positions.", sequence_matcher.matcher(guess.sequence)
  end
end
