require_relative "juvet/attributable"
require_relative "juvet/bot"
require_relative "juvet/configuration"
require_relative "juvet/repository"
require_relative "juvet/string"

module Juvet
  def self.configuration
    @configuration ||= Juvet::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end
