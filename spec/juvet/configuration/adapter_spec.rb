describe Juvet::Configuration::Adapter do
  describe "#type" do
    it "sets the type from the options" do
      subject = described_class.new type: :null
      expect(subject.type).to eq :null
    end
  end

  describe "#uri" do
    it "sets the uri from the options" do
      subject = described_class.new uri: "http://localhost:3000"
      expect(subject.uri).to eq "http://localhost:3000"
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

  describe "#build" do
    let(:mapper) { double(:mapper, collection_for_repository: nil) }
    subject { described_class.new type: :null }

    it "creates an instance of the adapter" do
      adapter = subject.build mapper

      expect(adapter).to be_instance_of Juvet::Adapters::NullAdapter
    end

    it "returns a load error if the adapter type cannot be loaded" do
      subject = described_class.new type: :blah

      expect { subject.build(mapper) }.to raise_error LoadError
    end
  end
end
