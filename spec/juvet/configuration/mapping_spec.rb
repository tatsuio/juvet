describe Juvet::Configuration::Mapping do
  describe "#build" do
    let(:blk) do
      Proc.new {
        collection :widgets do
        end
      }
    end
    subject { described_class.new &blk }

    it "creates a mapper from a block" do
      result = subject.build

      expect(result).to be_an_instance_of Juvet::Mapper
      expect(result.collections.length).to eq 1
    end
  end
end
