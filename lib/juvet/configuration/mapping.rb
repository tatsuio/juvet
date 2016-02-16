require "juvet/mapper"

module Juvet
  class Configuration
    class Mapping
      def initialize(&block)
        @block = block
      end

      def build(adapter)
        mapper = Juvet::Mapper.new &@block
        mapper.build(adapter)
        mapper
      end
    end
  end
end
