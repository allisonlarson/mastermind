gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_matcher'
require_relative '../lib/sequence_generator'
require_relative '../lib/guess'
require 'pry'

class SequenceMatcherTest < Minitest::Test

  def test_it_alerts_when_correct_letters_are_used
    sequence_matcher = SequenceMatcher.new(['Y', 'G', 'B', 'R'])
    guess = Guess.new('ggbr')
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal 3, sequence_matcher.colors
  end

  def test_it_does_not_alert_when_no_letters_are_used
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
    guess = Guess.new('rrrr')
    sequence_matcher.correct_letters(guess.sequence)
    assert_equal 0, sequence_matcher.colors
  end

  def test_it_alerts_when_correct_positions_are_found
    sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'R', 'G'])
    guess = Guess.new('yyyy')
    sequence_matcher.correct_position(guess.sequence)
    assert_equal 2, sequence_matcher.positions
  end

  def test_it_does_not_alert_when_no_positions_found
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B'])
    guess = Guess.new('bgry')
    sequence_matcher.correct_position(guess.sequence)
    assert_equal 0, sequence_matcher.positions
  end

  def test_it_holds_data_in_an_hash
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B'])
    guess = Guess.new('rrrr')
    sequence_matcher.matcher(guess.sequence)
    assert true, @clues.is_a?(Hash)
    assert 1, sequence_matcher.clues["correct_positions"]
  end

  def test_it_works_for_6_positions
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B', 'C','M'])
    guess = Guess.new('rrgcy')
    sequence_matcher.matcher(guess.sequence)
    assert_equal 2, sequence_matcher.positions
  end

  def test_it_works_for_8_positions
    sequence_matcher = SequenceMatcher.new(['R','G','B','Y','C','M'])
    guess = Guess.new('mmmmmmmm')
    sequence_matcher.matcher(guess.sequence)
    assert_equal 1, sequence_matcher.positions
  end

  def test_it_works_for_6_positions
    sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B', 'C','M'])
    guess = Guess.new('rrgcy')
    sequence_matcher.matcher(guess.sequence)
    assert_equal 2, sequence_matcher.colors
  end

  def test_it_works_for_8_positions
    sequence_matcher = SequenceMatcher.new(['R','G','B','Y','C','M'])
    guess = Guess.new('mmmmmmmm')
    sequence_matcher.matcher(guess.sequence)
    assert_equal 0, sequence_matcher.colors
  end
  # def test_it_matches_guess_and_sequence
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['R', 'Y', 'B', 'G'])
  #   guess = Guess.new('rybg')
  #   assert_equal true, sequence_matcher.win?(guess.sequence)
  # end
  #
  # def test_no_common_elements
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
  #   guess = Guess.new('gggg')
  #   sequence_matcher.correct_position(guess.sequence)
  #   sequence_matcher.correct_letters(guess.sequence)
  #   assert_equal "No common colors or positions.", sequence_matcher.lose?
  # end
  #
  # def test_print_clues
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['Y', 'R', 'G', 'B'])
  #   guess = Guess.new('ygrb')
  #   sequence_matcher.correct_position(guess.sequence)
  #   sequence_matcher.correct_letters(guess.sequence)
  #   assert_equal "You have 2 correct positions. You have 2 correct colors in incorrect positions.", sequence_matcher.print_clues
  # end
  #
  # def test_runs_the_matcher_and_wins
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
  #   guess = Guess.new('yyyy')
  #   assert_equal "You are correct!", sequence_matcher.matcher(guess.sequence)
  # end
  #
  # def test_runs_matcher_and_has_correct_letters_and_positions
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'R', 'G'])
  #   guess = Guess.new('yygr')
  #   assert_equal "You have 2 correct positions. You have 2 correct colors in incorrect positions.", sequence_matcher.matcher(guess.sequence)
  # end
  #
  # def test_runs_matcher_and_loses
  #   skip
  #   sequence_matcher = SequenceMatcher.new(['Y', 'Y', 'Y', 'Y'])
  #   guess = Guess.new('rrrr')
  #   assert_equal "No common colors or positions.", sequence_matcher.matcher(guess.sequence)
  # end
end
