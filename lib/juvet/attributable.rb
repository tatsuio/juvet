module Juvet
  module Attributable
    def initialize(attributes={})
      initialize! attributes
      attribute! attributes
    end

    def initialize!(attributes)
      attributes.each { |name, value| define_variable! name, value }
    end

    def attribute!(attributes)
      attributes.keys.each { |name| define_attribute! name }
    end

    private

    def create_method(name, &block)
      self.class.send(:define_method, name, &block)
    end

    def define_attribute!(name)
      define_getter!(name)
      define_setter!(name)
    end

    def define_getter!(name)
      create_method name do
        instance_variable_get("@#{name}")
      end
    end

    def define_setter!(name)
      create_method "#{name}=" do |value|
        instance_variable_set("@#{name}", value)
      end
    end

    def define_variable!(name, value)
      instance_variable_set("@#{name}", value)
    end
  end
end
