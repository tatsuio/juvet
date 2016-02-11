require "juvet/mapper"

module Juvet
  class Configuration
    class Mapping
      def initialize(&block)
        @block = block
      end

      def build
        Juvet::Mapper.new &@block
      end
    end
  end
end
