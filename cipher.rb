class Cipher
  attr_reader :message, :key

  def initialize(params)
    @message = params[:message]
    @key = params[:key]
  end
  
  def translate_all
    iterate.join
  end
  
private

  def iterate
    split_string.map! do |char|
      if /[a-zA-Z]/.match(char)
        shifted_int(char).chr
      else
        char
      end
    end
  end

  def split_string
    self.message.split(//)
  end

  def shifted_int(char)
    (char.ord + shift - starting_int(char)) % 26 + starting_int(char)
  end

  def shift
    self.key % 26
  end
  
  def starting_int(char)
    /[a-z]/.match(char) ? "a".ord : "A".ord
  end
  
end