class Guess

  attr_accessor :sequence

  def initialize(input)
    @sequence = input.upcase.split(//)
    @started_at = Time.now
  end
end
