class Validator

  attr_reader

  def self.length?(input)
    input.length == 4
  end

  def self.characters?
    input.each_char do |char|
      ['g', 'y', 'b', 'r'].include?(char)
    end
  end


end
