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
  end
end
