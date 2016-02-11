module Juvet
  class Bot
    include Attributable

    attr_reader :id

    class << self
      def create(id, attributes={})
        new id, attributes
      end

      def create!(id, attributes={})
        bot = create id, attributes
        BotRepository.create bot
      end
    end

    private

    def initialize(id, attributes={})
      @id = id
      super attributes
    end
  end
end
