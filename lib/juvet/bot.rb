module Juvet
  class Bot
    include Attributable

    attr_reader :id

    class << self
      def create(id, attributes={})
        bot = new id, attributes
        BotRepository.persist bot
      end
    end

    private

    def initialize(id, attributes={})
      @id = id
      super attributes
    end
  end
end
