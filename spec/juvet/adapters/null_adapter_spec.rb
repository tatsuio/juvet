describe Juvet::Adapters::NullAdapter do
  let(:entity) { Object.new }
  subject { described_class.new }

  describe "#all" do
    it "simply returns an empty array" do
      expect(subject.all).to be_empty
    end
  end

  describe "#create" do
    it "simply returns the entity" do
      expect(subject.create(entity)).to eq entity
    end
  end

  describe "#find" do
    it "returns nil" do
      expect(subject.find("blah")).to be_nil
    end
  end

  describe "#persist" do
    it "simply returns the entity" do
      expect(subject.persist(entity)).to eq entity
    end
  end

  describe "#update" do
    it "simply returns the entity" do
      expect(subject.update(entity)).to eq entity
    end
  end
end
