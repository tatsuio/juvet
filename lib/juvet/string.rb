module Juvet
  class String
    def initialize(string)
      @string = string.to_s
    end

    def classify
      string.split("_").map{ |w| w.capitalize }.join
    end

    def underscore
      modified = string.gsub(/(.)([A-Z])/,'\1_\2')
      modified.downcase
    end

    private

    attr_reader :string
  end
end
