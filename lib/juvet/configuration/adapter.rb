module Juvet
  class Configuration
    class Adapter
      attr_reader :class_name
      attr_reader :options
      attr_reader :type

      def initialize(options={})
        opts = default_options.merge((options || {}))

        @type = opts.delete :type
        @options = opts
        @class_name = Juvet::String.new("#{type}_adapter").classify
      end

      def build(mapper)
        load_adapter
        instantiate_adapter mapper
      end

      private

      def default_options
        { type: :null }.freeze
      end

      def load_adapter
        require "juvet/adapters/#{type}_adapter"
      rescue LoadError => e
        raise LoadError.new("Cannot find Juvet adapter '#{type}' (#{e.message})")
      end

      def instantiate_adapter(mapper)
        klass = Juvet::Adapters.const_get(class_name)
        klass.new(mapper.collection_for_repository(klass), options)
      end
    end
  end
end
