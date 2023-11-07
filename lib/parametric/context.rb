module Parametric
  class Top
    attr_reader :errors

    def initialize
      super
      @errors = {}
    end

    def add_error(key, msg)
      errors[key] = [msg]
    end
  end

  class Context
    def initialize(path = nil, top = Top.new)
      super
      @top = top
      @path = Array(path).compact
    end

    delegate :errors, to: :top

    def add_error(msg)
      top.add_error(string_path, msg)
    end

    def sub(key)
      self.class.new(path + [key], top)
    end

    protected
    attr_reader :path, :top

    def string_path
      path.reduce(['$']) do |m, segment|
        m << (segment.is_a?(Integer) ? "[#{segment}]" : ".#{segment}")
      end.join
    end
  end
end
