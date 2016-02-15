describe Juvet::Configuration::Adapter do
  describe "#type" do
    it "sets the type from the options" do
      subject = described_class.new :null
      expect(subject.type).to eq :null
    end
  end

  describe "#options" do
    it "includes any additional options initialized" do
      subject = described_class.new :null, blah: :bleh
      expect(subject.options).to eq({ blah: :bleh })
    end
  end

  describe "#class_name" do
    it "creates a class name from the type" do
      subject = described_class.new :null
      expect(subject.class_name).to eq "NullAdapter"
    end
  end

  describe "default type" do
    it "has a null adapter type" do
      expect(described_class.new.type).to eq :null
      expect(described_class.new.class_name).to eq "NullAdapter"
    end
  end

  describe "#build" do
    subject { described_class.new :redis }

    it "loads the adapter" do
      subject.build
      expect { Juvet::Adapters::RedisAdapter }.to_not raise_error
    end

    it "returns a load error if the adapter type cannot be loaded" do
      subject = described_class.new :blah

      expect { subject.build }.to raise_error LoadError
    end
  end
end
