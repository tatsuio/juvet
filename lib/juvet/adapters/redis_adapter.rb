require "json"
require "redis"

module Juvet
  module Adapters
    class RedisAdapter
      attr_reader :collection, :redis

      def initialize(collection, options={})
        @collection = collection
        @redis = Redis.new options
      end

      def create(entity)
        update_attributes entity
      end

      def destroy(id)
        redis.del collection_key(id)
      end

      def find(id)
        attributes = redis.get(collection_key(id))
        return nil if attributes.nil?
        collection.entity.new ({ id: id }).merge(JSON.load(attributes))
      end

      def persist(entity)
        find(entity.id).nil? ? create(entity) : update_attributes(entity)
      end

      def update(entity)
        raise EntityNotFoundError if find(entity.id).nil?
        update_attributes entity
      end

      private

      def collection_key(id)
        "#{Juvet::String.new(collection.name).underscore}:#{id}"
      end

      def key(entity)
        collection_key entity.id
      end

      def update_attributes(entity)
        redis.set key(entity), entity.attributes.to_json
        entity
      end
    end
  end
end
