# frozen_string_literal: true

module Collections
  class Queue
    def initialize
      @top = nil
      @queue = []
    end
  
    # Set new top value
    def set_top(new_top)
      @top = new_top
      @queue[0] = new_top
    end
  
    # Set queue from existing array
    def set_queue(arr)
      if arr.length > 0
        @queue = []
        arr.each{ |x| @queue.append(x) }
        @top = @queue[0]
      end 
    end
  
    # Add element to queue
    def push(element)
      if @queue.length == 0
        @top = element
      end
      @queue.append(element)
    end
  
    # Delete top of the queue and get its value
    def pop
      prev = @top
      @queue = @queue[1..]
      @top = @queue[0]
      prev
    end
  
    # Clear queue
    def clear
      @top = nil
      @queue = []
    end
  
    # Create Stack from existing Queue
    def to_s
      tmp = Stack.new
      tmp.set_stack(@queue)
      tmp
    end

    # Insert element at index
    def insert(element, index)
      raise IndexError if index < 0 || index > @queue.length
      if index == 0
        @top = element
        @queue = [element] + @queue
      else
        @queue = @queue[..index - 1] + [element] + @queue[index..]
      end
    end
  
    # Get queue size
    def size
      @queue.length
    end
  
    # Check if queue is empty
    def is_empty
      @queue.length == 0
    end
    
    # Check if queue contains element
    def contains(element)
      @queue.include?(element)
    end
  
    # Print queue
    def print
      puts "TOP -> #{@top}"
      @queue[1..].each{ |x| puts sprintf("%6s #{x}", '')}
    end
  
    # Get element's index 
    def index(element)
      if @queue.include?(element)
        i = 0
        @queue.each{ |x|
          break if x == element
          i += 1}
        i
      else
        -1
      end
    end

    # Create array from queue
    def to_a
      new_arr = []
      @queue.each{ |x| new_arr.append(x) }
      new_arr
    end
  
    attr_reader :top
  end
end