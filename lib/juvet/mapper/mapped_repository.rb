module Juvet
  class Mapper
    class MappedRepository
      attr_reader :klass, :adapter

      def initialize(klass, options=nil)
        @klass = klass
        @adapter = (options || {}).fetch(:adapter) { :null }
      end
    end
  end
end
