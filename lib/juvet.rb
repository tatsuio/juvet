require_relative "juvet/attributable"
require_relative "juvet/bot"
require_relative "juvet/bot_repository"
require_relative "juvet/configuration"
require_relative "juvet/entity_not_found_error"
require_relative "juvet/mapper"
require_relative "juvet/repository"
require_relative "juvet/string"

module Juvet
  def self.configuration
    @configuration ||= Juvet::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
    configuration.load!
  end
end
