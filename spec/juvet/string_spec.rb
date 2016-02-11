describe Juvet::String do
  describe "#classify" do
    it "converts an underscored string to a camel case word" do
      expect(described_class.new("this_is_fine").classify).to eq "ThisIsFine"
    end
  end

  describe "#underscore" do
    it "converts camel case to underscore" do
      expect(described_class.new("ThisIsFine").underscore).to eq "this_is_fine"
    end
  end
end
