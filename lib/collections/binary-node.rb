module Collections
  class BinaryNode
    attr_accessor :value, :left, :right
    
    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end
    
    def leaf?
      @left.nil? && @right.nil?
    end
    
    def to_s
      @value.to_s
    end
  end
end
