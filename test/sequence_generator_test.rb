gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sequence_generator'

class SequenceGeneratorTest < Minitest::Test
  def test_generates_sequence
    sequence = SequenceGenerator.new
  end

  def test_sequence_is_four_letters_length
    sequence = SequenceGenerator.new
    answer = sequence.generate
    assert_equal 4, answer.length
  end

  def test_sequence_is_a_array
    sequence = SequenceGenerator.new
    answer = sequence.generate
    assert_equal true, answer.is_a?(Array)
  end

  def test_holds_sequence
    sequence = Sequence.new
    assert sequence.respond_to? :answer
  end
end
