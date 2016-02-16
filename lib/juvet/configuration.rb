require_relative "configuration/adapter"
require_relative "configuration/mapping"

module Juvet
  class Configuration
    def adapter(type=nil, options=nil)
      return @adapter if type.nil?
      @adapter ||= Juvet::Configuration::Adapter.new(type, options)
    end

    def mapping(&block)
      @mapping ||= Juvet::Configuration::Mapping.new(&block)
    end

    def load!
      mapping.build adapter
    end
  end
end
