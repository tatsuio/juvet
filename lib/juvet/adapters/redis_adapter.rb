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
      end

      private

      def key(entity)
        "#{Juvet::String.new(entity.class.name).underscore}:#{entity.id}"
      end
    end
  end
end
