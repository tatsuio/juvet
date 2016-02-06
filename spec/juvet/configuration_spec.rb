describe Juvet::Configuration do
  subject { described_class.new }

  it "has a default repository adapter" do
    subject.adapter = nil
    expect(subject.adapter).to be_instance_of Juvet::Configuration::Adapter
  end
end
