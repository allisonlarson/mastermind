class Validator

  attr_reader

  def self.length?(input)
    input.length == 4
  end

  def self.characters?
    valid_chars = []
    input.each_char do |char|
      valid_chars.include?(char)
    end
  end


end
