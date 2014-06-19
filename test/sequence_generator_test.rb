gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_generates_sequence
    sequence = SequenceGenerator.new
  end

  def test_sequence_is_a_array
    sequence = SequenceGenerator.new
    answer = sequence.generate(4, ['R','G','B','Y'])
    assert_equal true, answer.is_a?(Array)
  end

  def test_holds_sequence
    sequence = Sequence.new
    assert sequence.respond_to? :beginner
  end

  def test_beginner_is_four_letters_length
    sequence = SequenceGenerator.new
    answer = sequence.generate(4, ['R','G','B','Y'])
    assert_equal 4, answer.length
  end

  def test_intermediate_is_five_letters_length
    sequence = SequenceGenerator.new
    answer = sequence.generate(6, ['R','G','B','Y','C'])
    assert_equal 6, answer.length
  end

  def test_expert_is_five_letters_length
    sequence = SequenceGenerator.new
    answer = sequence.generate(8, ['R','G','B','Y','C','M'])
    assert_equal 8, answer.length
  end
end
