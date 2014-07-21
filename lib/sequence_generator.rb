class SequenceGenerator

  def generate(length, pool)
    @letters = (0...length).map { pool.sample}
  end

end

class Sequence

  attr_reader :beginner, :intermediate, :expert

  def initialize
    @beginner = SequenceGenerator.new.generate(4, ['R','G','B','Y'])
    @intermediate = SequenceGenerator.new.generate(6, ['R','G','B','Y','C'])
    @expert = SequenceGenerator.new.generate(8, ['R','G','B','Y','C','M'])
  end
end
