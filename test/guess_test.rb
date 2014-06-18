require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess'

class GuessTest < Minitest::Test
  def test_it_is_an_array
    guess = Guess.new('rrrr')
    assert_equal ['R', 'R', 'R', 'R'], guess.sequence
  end
end
