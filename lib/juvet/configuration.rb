require_relative "configuration/adapter"
require_relative "configuration/mapping"

module Juvet
  class Configuration
    def adapter(options=nil)
      @adapter ||= Juvet::Configuration::Adapter.new(options)
    end

    def mapping(&block)
      @mapping ||= Juvet::Configuration::Mapping.new(&block)
    end

    def load!
      adapter.build mapping.build
    end
  end
end
