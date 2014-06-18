class SequenceGenerator

  def generate
    letters = [['R','G','B','Y'],['R','G','B','Y'],['R','G','B','Y'],['R','G','B','Y']]
    letters.map {|a|
      a.shuffle.first
    }
  end

end

class Sequence

  attr_reader :answer

  def initialize
    @answer = SequenceGenerator.new.generate
  end  
end
