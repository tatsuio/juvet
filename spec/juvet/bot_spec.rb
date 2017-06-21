describe Juvet::Bot do
  describe ".create" do
    let(:id) { "T12345" }

    subject do
      described_class.create id, bot_access_token: "xoxb-blah", name: "blah"
    end

    it "creates an instance of the class" do
      expect(subject).to be_an_instance_of described_class
    end

    it "assigns the id" do
      expect(subject.id).to eq id
    end

    it "defines getters for the attributes" do
      expect(subject.bot_access_token).to eq "xoxb-blah"
      expect(subject.name).to eq "blah"
    end

    it "defines setters for the attributes" do
      subject.bot_access_token = "xoxb-bleh"

      expect(subject.bot_access_token).to eq "xoxb-bleh"
    end

    it "saves the data to the redis store" do
      subject

      expect($redis.get(id)).to_not be_nil
    end
  end
end
