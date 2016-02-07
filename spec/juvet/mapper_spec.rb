describe Juvet::Mapper do
  describe "#initialize" do
    it "generates collections based on the block" do
      subject = described_class.new do
        collection :widgets do; end
      end

      expect(subject.collections.length).to eq 1
      expect(subject.collections).to have_key :widgets
    end
  end

  describe "#collection" do
    subject { described_class.new }

    it "adds a collection with the block" do
      subject.collection(:widgets) do; end

      expect(subject.collections[:widgets]).to \
        be_instance_of Juvet::Mapper::Collection
    end
  end
end
