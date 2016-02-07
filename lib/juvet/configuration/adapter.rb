module Juvet
  class Configuration
    class Adapter
      attr_reader :class_name
      attr_reader :options
      attr_reader :type
      attr_reader :uri

      def initialize(options={})
        opts = (options || {}).dup

        @type = opts.delete :type
        @uri = opts.delete :uri
        @options = opts
        @class_name = "#{type}_adapter".split('_').map!{ |w| w.capitalize }.join
      end

      def build
        load_adapter
        instantiate_adapter
      end

      private

      def load_adapter
        require "juvet/adapters/#{type}_adapter"
      rescue LoadError => e
        raise LoadError.new("Cannot find Juvet adapter '#{type}' (#{e.message})")
      end

      def instantiate_adapter
        klass = Juvet::Adapters.const_get(class_name)
        klass.new(uri, options)
      end
    end
  end
end
