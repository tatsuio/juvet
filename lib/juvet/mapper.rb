require_relative "mapper/collection"

module Juvet
  class Mapper
    attr_reader :collections

    def initialize(&block)
      @collections = {}

      instance_eval(&block) if block_given?
    end

    def collection(name, &block)
      collections[name] = Juvet::Mapper::Collection.new &block
    end
  end
end
