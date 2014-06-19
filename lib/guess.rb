class Guess

  attr_accessor :sequence, :created_at

  def initialize(input)
    @sequence = input.upcase.split(//)
    @created_at = Time.now
  end
end
