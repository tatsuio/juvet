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

    it "does not override any existing instance variables" do
      subject = Ava.new name: "Ava"
      subject.instance_variable_set "@name", "Blah"
      subject.initialize! name: "Ava"

      expect(subject.instance_variable_get("@name")).to eq "Blah"
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

    it "does not override existing getters" do
      class Ava
        include Juvet::Attributable

        def name
          "Blah"
        end
      end
      subject = Ava.new name: "Ava"

      expect(subject.name).to eq "Blah"
    end

    it "defines the setters for the attributes" do
      expect(subject).to respond_to :age=
    end

    it "has working setters" do
      subject.age = 21
      expect(subject.age).to eq 21
    end

    it "does not override existing setters" do
      class Foo
        include Juvet::Attributable
        attr_reader :real_name

        def name=(value)
          @real_name = value
        end
      end
      subject = Foo.new name: "Ava"
      subject.name = "Athena"

      expect(subject.real_name).to eq "Athena"
      expect(subject.name).to eq "Ava"
    end
  end
end
