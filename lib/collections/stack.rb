# frozen_string_literal: true

module Collections
  class Stack
    def initialize
      @peek = nil
      @stack = []
    end
  
    # Set new peek value
    def set_peek(new_peek)
      @peek = new_peek
      if @stack.length > 0
        @stack[-1] = new_peek
      else
        @stack[0] = new_peek
      end
    end
  
    # Set new stack from existing array
    def set_stack(arr)
      if arr.length > 0
        @stack = []
        arr.each{ |x|  @stack.append(x) }
        @peek = @stack[-1]
      end
    end
  
    # Add element to stack
    def push(peek)
      @peek = peek
      @stack.append(peek)
    end
  
    # Get stack size
    def size
      @stack.length
    end
  
    # Check if stack is empty
    def is_empty
      @stack.length == 0
    end
  
    # Delete TOS and get its value
    def pop
      if !self.is_empty
        if stack.length == 1
          prev = @peek
          @stack = []
          @peek = nil
          prev
        else 
          @peek = stack[-2]
          @stack.pop()
        end
      end
    end
  
    # Clear stack
    def clear
      @peek = nil
      @stack = []
    end

    # Insert element at index
    def insert(element, index)
      raise IndexError if index < 0 || index > @stack.length
      if index == 0
        self.push(element)
      else
        @stack = @stack[..-(index + 1)] + [element] + @stack[-index..]
      end
    end
  
    # Check if stack contains element
    def contains(value)
      @stack.include?(value)
    end
  
    # Get element's index from TOS
    def index(element)
      if @stack.include?(element)
        i = 0
        @stack.reverse_each{ |x| 
          break if x == element
          i += 1
        }
        i
      else
        -1
      end
    end
  
    # Print stack
    def print
      n = @stack.length
      i = 2
      puts "TOS -> #{@peek}"
      @stack[..-2].reverse_each{ |x| puts sprintf("%6s #{x}", '')}
    end
  
    # Create Queue from existing Stack
    def to_q
      tmp = Queue.new
      tmp.set_queue(@stack)
      tmp
    end

    # Create Array from exsisting Stack
    def to_a
      new_arr = []
      @stack.each{ |x| new_arr.append(x) }
      new_arr
    end
  
    attr_reader :peek
  end
end

