describe Juvet::Mapper do
  describe "#initialize" do
    it "generates collections based on the block" do
      subject = described_class.new do
        collection :widgets do; end
      end

      expect(subject.collections.length).to eq 1
      expect(subject.collections).to have_key :widgets
    end
  end

  describe "#collection" do
    subject { described_class.new }

    it "adds a collection with the block" do
      subject.collection(:widgets) do; end

      expect(subject.collections[:widgets]).to \
        be_instance_of Juvet::Mapper::Collection
    end
  end

  describe "#collection_for_repository" do
    class WidgetRepository; end
    let(:subject) do
      described_class.new do
        collection :widgets do
          repository WidgetRepository
        end
      end
    end

    it "returns the collection for the first one that specifies the repository" do
      result = subject.collection_for_repository WidgetRepository

      expect(result.name).to eq :widgets
      expect(result.repository).to eq WidgetRepository
    end

    it "returns nil if the repository is not found" do
      result = subject.collection_for_repository Object

      expect(result).to be_nil
    end
  end
end
