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

      def all
        redis.keys("#{collection_prefix}:*").map do |key|
          find_by_key(key)
        end
      end

      def create(entity)
        update_attributes entity
      end

      def destroy(id)
        redis.del collection_key(id)
      end

      def find(id)
        find_by_key collection_key(id)
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
        "#{collection_prefix}:#{id}"
      end

      def collection_prefix
        Juvet::String.new(collection.name).underscore
      end

      def find_by_key(key)
        attributes = redis.get key
        return nil if attributes.nil?
        collection.entity.new ({ id: id_from_key(key) }).merge(JSON.load(attributes))
      end

      def id_from_key(key)
        key.gsub("#{collection_prefix}:", "")
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
