describe Juvet::Configuration do
  subject { described_class.new }

  it "has a default repository adapter" do
    expect(subject.adapter({})).to be_instance_of Juvet::Configuration::Adapter
  end

  it "has a default mapping" do
    expect(subject.mapping).to be_instance_of Juvet::Configuration::Mapping
  end

  describe "#load!" do
    subject { described_class.new }

    it "builds the mapping" do
      subject.adapter({})
      expect(subject.mapping).to receive(:build).and_call_original
      subject.load!
    end

    it "builds the adapter" do
      expect(subject.adapter({})).to receive(:build).with(Juvet::Mapper)
      subject.load!
    end
  end
end
