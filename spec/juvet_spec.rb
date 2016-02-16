describe Juvet do
  describe ".configuration" do
    it "returns a new instance of the configuration" do
      expect(described_class.configuration).to be_instance_of Juvet::Configuration
    end
  end

  describe ".configure" do
    it "yields configuration" do
      allow(described_class.configuration).to receive(:load!)
      expect { |b| described_class.configure &b }.to \
        yield_with_args Juvet::Configuration
    end

    it "loads the configuration" do
      expect(described_class.configuration).to receive(:load!)
      described_class.configure
    end

    it "sets up the adapter" do
      described_class.configure do
        adapter :null, blah: "blah"
      end
      expect(described_class.configuration.adapter).to \
        be_instance_of Juvet::Configuration::Adapter
      expect(described_class.configuration.adapter.type).to eq :null
      expect(described_class.configuration.adapter.options).to eq({ blah: "blah" })
      expect(described_class.configuration.adapter.class_name).to eq "NullAdapter"
    end

    it "sets up the mapping" do
      described_class.configure do
        mapping do
        end
      end
      expect(described_class.configuration.mapping).to \
        be_instance_of Juvet::Configuration::Mapping
    end
  end
end
