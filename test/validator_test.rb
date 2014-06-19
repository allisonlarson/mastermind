require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validator'

class ValidatorTest < Minitest::Test
  def test_beginner_has_four_characters
    assert = Validator.length?('yyyy', 4)
  end

  def test_intermediate_has_six_characters
    assert Validator.length?('gggggg', 6)
  end

  def test_expert_has_eight_characters
    assert Validator.length?('ggggyyyy', 8)
  end

end
