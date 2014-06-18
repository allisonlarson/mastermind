require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/validator'

class ValidatorTest < Minitest::Test
  def test_it_has_four_characters
    validator = Validator.new('yyyy')
    assert validator.length?(4)
  end

  def test_it_does_not_have_four_characters
    validator = Validator.new('ght')
    refute validator.length?(4)
  end

  def test_it_uses_correct_characters
    validator = Validator.new('gggg')
    assert validator.characters?
  end

  def test_it_uses_incorrect_characters
    skip
    validator = Validator.new('!kyz')
    refute validator.characters?
  end
end
