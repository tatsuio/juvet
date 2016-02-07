require "json"
require "./lib/juvet/adapters/redis_adapter"

describe Juvet::Adapters::RedisAdapter do
  class Entity
    include Juvet::Attributable

    attr_accessor :id
    attr_accessor :blah

    def attributes
      { blah: blah }
    end
  end

  let(:entity) { Entity.new id: 123 }
  subject { described_class.new "redis://localhost:6379", db: 15 }

  before(:all) { @redis = Redis.new db: 15 }
  after(:all) { @redis.flushdb }

  describe "#create" do
    it "stores the entity in the redis store" do
      result = subject.create entity

      expect(result).to eq entity
      expect(@redis.get("entity:123")).to eq(JSON.generate({ blah: nil }))
    end
  end

  describe "#find" do
    it "finds the entity based on the id from the redis store" do
      subject.create entity
      result = subject.find entity.id

      expect(result.id).to eq entity.id
    end

    it "returns nil if the entity can't be found" do
      result = subject.find 789

      expect(result).to be_nil
    end
  end

  describe "#update" do
    it "updates the entity in the redis store" do
      created = subject.create entity
      created.blah = "bleh"
      result = subject.update created

      expect(result).to eq entity
      expect(@redis.get("entity:123")).to eq(JSON.generate({ blah: "bleh" }))
    end

    it "throws an exception if the entity is not already stored" do
      entity = Entity.new id: 456

      expect { subject.update entity }.to raise_error Juvet::EntityNotFoundError
    end
  end
end
