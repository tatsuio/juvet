describe Juvet::Mapper::Collection do
  describe "#initialize" do
    it "provides a name" do
      subject = described_class.new :widgets

      expect(subject.name).to eq :widgets
    end

    it "executes the block if one is provided" do
      subject = described_class.new(:widgets) do
        entity Object
        repository Object, adapter: :blah
      end

      expect(subject.entity).to eq Object
      expect(subject.repository.klass).to eq Object
      expect(subject.repository.adapter).to eq :blah
    end
  end
end
