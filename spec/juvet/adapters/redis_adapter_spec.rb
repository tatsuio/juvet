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

      expect(@redis.get("entity:123")).to eq(JSON.generate({ blah: nil }))
    end
  end
end
