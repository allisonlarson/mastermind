require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/cli'

class CLITest < Minitest::Test

  def test_it_exsists
    cli = CLI.new
    assert cli
  end

  def test_it_has_a_game
    cli = CLI.new
    assert cli.game
  end

end
