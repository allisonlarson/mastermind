require 'pry'
class Validator

  attr_reader

  def self.length?(input)
    input.length == 4
  end

  # def self.characters?(input)
  #   # valid_chars = ['r', 'g', 'y', 'b']
  #   input.each_char do |char|
  #     ['r', 'g', 'y', 'b'].include?(char)
  #   end
  # end


end
