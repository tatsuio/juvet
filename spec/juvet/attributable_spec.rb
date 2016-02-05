describe Juvet::Attributable do
  class Ava
    include Juvet::Attributable
  end

  describe "#initialize" do
    it "has a default initializer to accept attributes" do
      expect { Ava.new name: "Ava" }.to_not raise_error
    end
  end

  describe "#initialize!" do
    subject { Ava.new name: "Ava", age: nil }

    it "initializes instance variables" do
      expect(subject.instance_variable_get("@name")).to eq "Ava"
    end
  end

  describe "#attribute!" do
    subject { Ava.new name: "Ava", age: nil }

    it "defines the getters for the attributes" do
      expect(subject).to respond_to :name
    end

    it "responds to the getters" do
      expect(subject.name).to eq "Ava"
    end

    it "defines the setters for the attributes" do
      expect(subject).to respond_to :age=
    end

    it "has working setters" do
      subject.age = 21
      expect(subject.age).to eq 21
    end
  end
end
