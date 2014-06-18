require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validator'

class ValidatorTest < Minitest::Test
  def test_it_has_four_characters
    assert Validator.length?('yyyy')
  end

  def test_it_does_not_have_four_characters
    refute Validator.length?('ght')
  end

  # def test_it_uses_correct_characters
  #   skip
  #   assert Validator.characters?('gggg')
  # end
  #
  # def test_it_uses_incorrect_characters
  #   skip
  #   refute Validator.characters?('!kyz')
  # end
end
