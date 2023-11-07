module Parametric
  class Results
    attr_reader :output, :errors

    def initialize(output, errors)
      super
      @output = output
      @errors = errors
    end

    def valid?
      errors.keys.none?
    end
  end
end
