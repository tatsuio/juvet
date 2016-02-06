describe Juvet::Adapters::NullAdapter do
  let(:entity) { Object.new }
  subject { described_class.new }

  describe "#create" do
    it "simply returns the entity" do
      expect(subject.create(entity)).to eq entity
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
