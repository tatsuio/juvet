require "json"
require "redis"

module Juvet
  module Adapters
    class RedisAdapter
      attr_reader :redis

      def initialize(uri, options={})
        opts = { url: uri }.merge options
        @redis = Redis.new opts
      end

      def create(entity)
        redis.set key(entity), entity.attributes.to_json
        entity
      end

      def find(id)
        class_name = "Entity"
        attributes = redis.get(class_key(class_name, id))
        return nil if attributes.nil?
        Object.const_get(class_name).new ({ id: id }).merge(JSON.load(attributes))
      end

      def update(entity)
        raise EntityNotFoundError if find(entity.id).nil?
        redis.set key(entity), entity.attributes.to_json
        entity
      end

      private

      def class_key(class_name, id)
        "#{Juvet::String.new(class_name).underscore}:#{id}"
      end

      def key(entity)
        class_key entity.class.name, entity.id
      end
    end
  end
end
