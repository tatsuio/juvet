describe Juvet::Bot do
  describe ".create" do
    subject do
      described_class.create "T12345", bot_access_token: "xoxb-blah",
        name: "blah"
    end

    it "creates an instance of the class" do
      expect(subject).to be_an_instance_of described_class
    end

    it "assigns the id" do
      expect(subject.id).to eq "T12345"
    end

    it "defines getters for the attributes" do
      expect(subject.bot_access_token).to eq "xoxb-blah"
      expect(subject.name).to eq "blah"
    end

    it "defines setters for the attributes" do
      subject.bot_access_token = "xoxb-bleh"

      expect(subject.bot_access_token).to eq "xoxb-bleh"
    end
  end

  describe ".create!" do
    it "stores the created instance in the repository" do
      expect(Juvet::BotRepository).to receive(:create).with (Juvet::Bot)
      described_class.create! "blah", name: "blah"
    end
  end
end
