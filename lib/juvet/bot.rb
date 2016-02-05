module Juvet
  class Bot
    attr_reader :id

    class << self
      def create(id, attributes={})
        new id, attributes
      end
    end

    private

    def initialize(id, attributes={})
      @id = id
    end
  end
end
