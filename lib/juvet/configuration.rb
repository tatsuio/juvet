require_relative "configuration/adapter"

module Juvet
  class Configuration
    attr_reader :adapter

    def adapter=(options)
      @adapter ||= Juvet::Configuration::Adapter.new(options)
    end
  end
end
