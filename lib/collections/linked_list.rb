# frozen_string_literal: true

require_relative "node"

module Collections
  class LinkedList
    def initialize
      @head = nil
    end

    def append(data)
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
      new_node = Node.new(data)
      new_node.next_node = @head
      @head = new_node
    end

    def insert_into(index, data)
      if index == 0
        prepend(data)
      end
      current = @head
      (index - 1).times do
        current = current.next_node
      end
      new_node = Node.new(data)
      new_node.next_node = current.next_node
      current.next_node = new_node
    end

    def delete(index)
      if index == 0
        @head = @head.next_node
      end
      current = @head
      (index - 1).times do
        current = current.next_node
      end
      current.next_node = current.next_node == nil ? nil: current.next_node.next_node
    end

    def show
      current = @head
      while current
        p current.value
        current = current.next_node
      end
    end
  end
end
