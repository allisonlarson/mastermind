class SequenceGenerator

  # def beginner
  #   letters = [['R','G','B','Y'],['R','G','B','Y'],['R','G','B','Y'],['R','G','B','Y']]
  #   letters.map {|a|
  #     a.shuffle.first
  #   }
  # end
  #
  # def intermediate
  # letters = [['R','G','B','Y','C'],['R','G','B','Y','C'],['R','G','B','Y','C'],['R','G','B','Y','C'],
  # ['R','G','B','Y','C'],['R','G','B','Y','C']]
  # letters.map {|a|
  #   a.shuffle.first
  # }
  # end
  #
  # def expert
  # letters = [['R','G','B','Y','C','M'],['R','G','B','Y','C','M'],['R','G','B','Y','C','M'],
  # ['R','G','B','Y','C','M'],['R','G','B','Y','C','M'],['R','G','B','Y','C','M'],
  # ['R','G','B','Y','C','M'],['R','G','B','Y','C','M']]
  # letters.map {|a|
  #   a.shuffle.first
  # }
  # end

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
