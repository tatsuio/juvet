describe Juvet::Repository do
  class Repository
    include Juvet::Repository
  end

  it "defaults to using the NullAdapter" do
    expect(Repository.adapter).to be_instance_of Juvet::Adapters::NullAdapter
  end

  describe ".all" do
    it "passes the retrieval to the adapter" do
      expect(Repository.adapter).to receive(:all)
      Repository.all
    end
  end

  describe ".create" do
    it "passes creation to the adapter" do
      object = Object.new
      expect(Repository.adapter).to receive(:create).with object
      Repository.create object
    end
  end

  describe ".destroy" do
    it "passes the destroying to the adapter" do
      id = "123"
      expect(Repository.adapter).to receive(:destroy).with id
      Repository.destroy id
    end
  end

  describe ".find" do
    it "passes the finding to the adapter" do
      id = "123"
      expect(Repository.adapter).to receive(:find).with id
      Repository.find id
    end
  end

  describe ".persist" do
    it "passes persitance to the adapter" do
      object = Object.new
      expect(Repository.adapter).to receive(:persist).with object
      Repository.persist object
    end
  end

  describe ".update" do
    it "passes updating to the adapter" do
      object = Object.new
      expect(Repository.adapter).to receive(:update).with object
      Repository.update object
    end
  end
end
