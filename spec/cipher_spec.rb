require_relative '../cipher.rb'

describe Cipher do

  let (:cipher) { Cipher.new(:str => "What a string!", :key => 5)}

  describe "#translate" do
    it "returns a translated string" do
      expect(cipher.translate_all).to eql("Bmfy f xywnsl!")
    end
  end
end

