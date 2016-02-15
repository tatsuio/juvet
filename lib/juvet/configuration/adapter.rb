module Juvet
  class Configuration
    class Adapter
      attr_reader :class_name
      attr_reader :options
      attr_reader :type

      def initialize(type=nil, options={})
        opts = (options || {}).dup

        @type = type || :null
        @options = opts
        @class_name = Juvet::String.new("#{self.type}_adapter").classify
      end

      def build
        load_adapter
      end

      private

      def load_adapter
        require "juvet/adapters/#{type}_adapter"
      rescue LoadError => e
        raise LoadError.new("Cannot find Juvet adapter '#{type}' (#{e.message})")
      end
    end
  end
end
