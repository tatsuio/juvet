describe Juvet::Configuration do
  subject { described_class.new }

  it "has a default repository adapter" do
    subject.adapter = nil
    expect(subject.adapter).to be_instance_of Juvet::Configuration::Adapter
  end

  it "has a default mapping" do
    expect(subject.mapping).to be_instance_of Juvet::Configuration::Mapping
  end

  describe "#load!" do
    xit "builds the mapping"
    xit "builds the adapter"
  end
end
