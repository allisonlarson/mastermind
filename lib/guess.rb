class Guess

  attr_accessor :sequence

  def initialize(input)
    @sequence = input.upcase.split(//)
  end
end
