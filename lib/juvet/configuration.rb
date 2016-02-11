require_relative "configuration/adapter"
require_relative "configuration/mapping"

module Juvet
  class Configuration
    attr_reader :adapter

    def adapter=(options)
      @adapter ||= Juvet::Configuration::Adapter.new(options)
    end

    def mapping(&block)
      @mapping ||= Juvet::Configuration::Mapping.new(&block)
    end

    def load!
    end
  end
end
