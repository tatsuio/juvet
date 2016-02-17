require_relative "adapters/null_adapter"

module Juvet
  module Repository
    def self.included(base)
      base.class_eval do
        extend ClassMethods

        self.adapter = Adapters::NullAdapter.new
      end
    end

    module ClassMethods
      def adapter
        @adapter
      end

      def adapter=(adapter)
        @adapter = adapter
      end

      def all
        adapter.all
      end

      def create(entity)
        adapter.create entity
      end

      def destroy(id)
        adapter.destroy id
      end

      def find(id)
        adapter.find id
      end

      def persist(entity)
        adapter.persist entity
      end

      def update(entity)
        adapter.update entity
      end
    end
  end
end
