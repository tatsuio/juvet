describe Juvet::Configuration do
  subject { described_class.new }

  it "has a default repository adapter" do
    expect(subject.adapter(:null)).to be_instance_of Juvet::Configuration::Adapter
  end

  it "has a default mapping" do
    expect(subject.mapping).to be_instance_of Juvet::Configuration::Mapping
  end

  describe "#load!" do
    subject { described_class.new }

    it "builds the mapping" do
      subject.adapter :null
      expect(subject.mapping).to receive(:build).with(subject.adapter)
      subject.load!
    end
  end
end
