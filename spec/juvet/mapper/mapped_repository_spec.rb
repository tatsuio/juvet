describe Juvet::Mapper::MappedRepository do
  describe "#initialize" do
    it "extracts the adapter from the options" do
      subject = described_class.new Object, adapter: :blah
      expect(subject.adapter).to eq :blah
    end

    it "defaults to the null adapter if it's not specified" do
      subject = described_class.new Object
      expect(subject.adapter).to eq :null
    end
  end
end
