module Juvet
  class Bot
    include Attributable

    attr_reader :id

    class << self
      def create(id, attributes={})
        new id, attributes
      end

      def create!(id, attributes={})
        BotRepository.create create(id, attributes)
      end

      def destroy!(id)
        BotRepository.destroy id
      end

      def find!(id)
        BotRepository.find id
      end
    end

    def update!(attributes={})
      BotRepository.update self
    end

    private

    def initialize(id, attributes={})
      @id = id
      super attributes
    end
  end
end
