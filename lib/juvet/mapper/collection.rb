require_relative "mapped_repository"

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

      def repository(klass=nil, options=nil)
        if klass
          @repository = MappedRepository.new klass, options
        else
          @repository
        end
      end
    end
  end
end
