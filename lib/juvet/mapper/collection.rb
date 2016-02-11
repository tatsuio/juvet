module Juvet
  class Mapper
    class Collection
      attr_reader :name

      def initialize(name, &block)
        @name = name
        instance_eval(&block) if block_given?
      end

      def entity(klass=nil)
        if klass
          @entity = klass
        else
          @entity
        end
      end

      def repository(klass=nil)
        if klass
          @repository = klass
        else
          @repository
        end
      end
    end
  end
end
