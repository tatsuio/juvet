describe Juvet::Configuration::Adapter do
  describe "#type" do
    it "sets the type from the options" do
      subject = described_class.new type: :null
      expect(subject.type).to eq :null
    end
  end

  describe "#options" do
    it "includes any additional options initialized" do
      subject = described_class.new type: :nil, blah: :bleh
      expect(subject.options).to eq({ blah: :bleh })
    end
  end

  describe "#class_name" do
    it "creates a class name from the type" do
      subject = described_class.new type: :null
      expect(subject.class_name).to eq "NullAdapter"
    end
  end

  describe "default options" do
    it "has a null adapter type" do
      expect(described_class.new.type).to eq :null
      expect(described_class.new.class_name).to eq "NullAdapter"
    end
  end

  describe "#build" do
    let(:collection) { double(:collection, repository: repository) }
    let(:repository) { double(:repository, "adapter=" => nil) }
    let(:mapper) { double(:mapper, collection_for_repository: collection, collections: { blah: collection }) }
    subject { described_class.new type: :null }

    it "creates an instance of the adapter" do
      adapter = subject.build mapper

      expect(adapter).to be_instance_of Juvet::Adapters::NullAdapter
    end

    it "returns a load error if the adapter type cannot be loaded" do
      subject = described_class.new type: :blah

      expect { subject.build(mapper) }.to raise_error LoadError
    end

    it "sets the adapter for all the repositories in the mapper" do
      expect(repository).to receive(:adapter=).with(Juvet::Adapters::NullAdapter)
      subject.build(mapper)
    end
  end
end
