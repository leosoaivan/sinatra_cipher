class Cipher
  attr_reader :str, :key

  def initialize(args)
    @str = args[:str]
    @key = args[:key]
  end
  
  def translate_all
    iterate.join
  end
  
private

  def shift
    key % 26
  end

  def split_string
    str.split(//)
  end

  def iterate
    split_string.map! do |char|
      if /[a-zA-Z]/.match(char)
        ending_int(char).chr
      else
        char
      end
    end
  end

  def ending_int(char)
    (char.ord + shift - starting_int(char)) % 26 + starting_int(char)
  end
  
  def starting_int(char)
    /[a-z]/.match(char) ? "a".ord : "A".ord
  end
  
end