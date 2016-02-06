describe Juvet::Repository do
  class Repository
    include Juvet::Repository
  end

  it "defaults to using the NullAdapter" do
    expect(Repository.adapter).to be_instance_of Juvet::Adapters::NullAdapter
  end

  describe ".create" do
    it "passes creation to the adapter" do
      object = Object.new
      expect(Repository.adapter).to receive(:create).with object
      Repository.create object
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
