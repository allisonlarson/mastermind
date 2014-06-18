require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'
require_relative '../lib/mastermind'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    mastermind = Mastermind.new
    @cli ||= CLI.new(mastermind)
  end

  def test_it_exsists
    assert cli
  end

  def test_it_has_a_command
    assert cli.command
  end

  def test_it_has_a_game
    assert cli.game
  end

  def test_it_accepts_input
    input = 'rrrr'
    
  end

end
