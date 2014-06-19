require 'pry'
class Validator


  def self.length?(input, number)
    input.length == number
  end
  # 
  # def self.intermediate_length?(input)
  #   input.length == 6
  # end
  #
  # def self.expert_length?(input)
  #   input.length == 8
  # end

  # def self.characters?(input)
  #   # valid_chars = ['r', 'g', 'y', 'b']
  #   input.each_char do |char|
  #     ['r', 'g', 'y', 'b'].include?(char)
  #   end
  # end
end
