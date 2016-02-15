require_relative "mapper/collection"

module Juvet
  class Mapper
    attr_reader :collections

    def initialize(&block)
      @collections = {}

      instance_eval(&block) if block_given?
    end

    def collection(name, &block)
      collections[name] = Juvet::Mapper::Collection.new name, &block
    end

    def collection_for_repository(klass)
      collections.values.find { |collection| collection.repository.klass == klass }
    end
  end
end
