describe Juvet do
  describe ".configuration" do
    it "returns a new instance of the configuration" do
      expect(described_class.configuration).to be_instance_of Juvet::Configuration
    end
  end

  describe ".configure" do
    it "yields configuration" do
      expect { |b| described_class.configure &b }.to \
        yield_with_args Juvet::Configuration
    end
  end
end
