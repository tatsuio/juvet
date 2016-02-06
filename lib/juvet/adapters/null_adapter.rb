module Juvet
  module Adapters
    class NullAdapter
      def create(entity)
        entity
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
