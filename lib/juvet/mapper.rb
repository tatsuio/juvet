module Juvet
  class Mapper
    attr_reader :collections

    def initialize(&block)
      @collections = {}

      instance_eval(&block) if block_given?
    end

    def collection(name, &block)
      collections[name] = nil
    end
  end
end
