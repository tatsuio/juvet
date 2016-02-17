describe Juvet::Bot do
  describe ".create" do
    subject do
      described_class.create "xoxb-blah", team_id: "Blah",
        name: "blah"
    end

    it "creates an instance of the class" do
      expect(subject).to be_an_instance_of described_class
    end

    it "assigns the id" do
      expect(subject.id).to eq "xoxb-blah"
    end

    it "defines getters for the attributes" do
      expect(subject.team_id).to eq "Blah"
      expect(subject.name).to eq "blah"
    end

    it "defines setters for the attributes" do
      subject.name = "Thor!"

      expect(subject.name).to eq "Thor!"
    end
  end

  describe ".all!" do
    it "returns all the bots from the repository" do
      expect(Juvet::BotRepository).to receive(:all)
      described_class.all!
    end
  end

  describe ".create!" do
    it "stores the created instance in the repository" do
      expect(Juvet::BotRepository).to receive(:create).with Juvet::Bot
      described_class.create! "blah", name: "blah"
    end
  end

  describe ".destroy!" do
    let!(:bot) { described_class.create! "xoxb-blah", team_id: "Blah" }

    it "removes the instance from the repository" do
      expect(Juvet::BotRepository).to receive(:destroy).with "xoxb-blah"
      described_class.destroy! bot.id
    end
  end

  describe ".find" do
    let!(:bot) { described_class.create! "xoxb-blah", team_id: "Blah" }

    it "creates an instance from the repository" do
      expect(Juvet::BotRepository).to receive(:find).with "xoxb-blah"
      described_class.find! bot.id
    end
  end

  describe "#update!" do
    let!(:bot) { described_class.create! "xoxb-blah", team_id: "Blah" }

    it "updates the instance in the repository" do
      expect(Juvet::BotRepository).to receive(:update).with bot
      bot.update! team_id: "Bleh"
    end
  end
end
