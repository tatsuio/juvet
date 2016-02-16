module Juvet
  class Bot
    include Attributable

    attr_reader :id

    class << self
      def create(id, attributes={})
        new attributes.merge(id: id)
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
  end
end
