module Juvet
  module Adapters
    class NullAdapter
      def initialize(collection=nil, options={})
      end

      def create(entity)
        entity
      end

      def destroy(id)
      end

      def find(id)
      end

      def persist(entity)
        entity
      end

      def update(entity)
        entity
      end
    end
  end
end
