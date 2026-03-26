# frozen_string_literal: true

require_relative "node"

module Collections
  class LinkedList
    def initialize(data = nil)
      @head = Node.new(data) if data
    end

    def append(data)
      # Add data in the end of the list
      new_node = Node.new(data)
      if @head.nil?
        @head = new_node
        return
      end
      current = @head
      while current.next_node
        current = current.next_node
      end
      current.next_node = new_node
    end

    def prepend(data)
      # Add data before the first element in the list
      new_node = Node.new(data)
      new_node.next_node = @head
      @head = new_node
    end

    def insert_at(index, data)
      raise IndexError if index < 0
      # Insert data at position

      if index == 0
        prepend(data)
        return
      end

      current = @head
      (index - 1).times do
        raise IndexError, "Index #{index} out of bounds" if current.nil?
        current = current.next_node
      end
      new_node = Node.new(data)
      new_node.next_node = current.next_node
      current.next_node = new_node

    end

    def delete_at(index)
      # Delete element by index and return
      raise IndexError, "Index #{index} out of bounds" if index < 0
      raise IndexError, "List is empty" if @head.nil?

      if index == 0
        deleted = @head
        @head = @head.next_node
        return deleted.value
      end
      current = @head
      (index - 1).times do
        raise IndexError, "Index #{index} out of bounds" if current.nil?
        current = current.next_node
      end
      deleted = current.next_node
      current.next_node = current.next_node.next_node
      deleted.value
    end

    def to_a
      # Create array from Linked List
      current = @head
      array = []
      while current
        array << current.value
        current = current.next_node
      end
      array
    end

    def at(index)
      # Find element by index
      raise IndexError, "Index #{index} out of bounds" if index < 0
      raise IndexError, "List is empty" if @head.nil?

      current = @head
      index.times do
        raise IndexError, "Index #{index} out of bounds" if current.nil?
        current = current.next_node
      end
      raise IndexError, "Index #{index} out of bounds" if current.nil?
      current.value
    end

    def find(data)
      # Find element by element value
      current = @head
      while current
        if current.value == data
          return current
        end
        current = current.next_node
      end
      nil
    end

    def size
      # Return the size of the list
      count = 0
      current = @head
      while current
        count += 1
        current = current.next_node
      end
      count
    end

    def empty?
      @head.nil?
    end
  end
end
