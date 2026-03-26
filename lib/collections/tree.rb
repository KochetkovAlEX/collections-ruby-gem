require_relative "binary-node"

module Collections
  class Tree
    attr_accessor :root
    
    def initialize
      @root = nil
    end
    
    def self.with_root(value)
      tree = new
      tree.add(value)
      tree
    end
    
    def self.build(&block)
      tree = new
      tree.instance_eval(&block) if block_given?
      tree
    end
    
    def self.from_values(*values)
      tree = new
      values.flatten.each { |value| tree.add(value) }
      tree
    end
    
    def add(value)
      @root = insert_recursive(@root, value)
    end
    
    def delete(value)
      @root = delete_recursive(@root, value)
    end
    
    def display
      return puts "Дерево пустое" if @root.nil?
      display_recursive(@root, "", true)
    end
    
    private
    
    def insert_recursive(node, value)
      return BinaryNode.new(value) if node.nil?
      
      if value < node.value
        node.left = insert_recursive(node.left, value)
      elsif value > node.value
        node.right = insert_recursive(node.right, value)
      end
      
      node
    end
    
    def delete_recursive(node, value)
      return nil if node.nil?
      
      if value < node.value
        node.left = delete_recursive(node.left, value)
      elsif value > node.value
        node.right = delete_recursive(node.right, value)
      else
        return node.right if node.left.nil?
        return node.left if node.right.nil?
        
        min_node = find_min(node.right)
        node.value = min_node.value
        node.right = delete_recursive(node.right, min_node.value)
      end
      
      node
    end
    
    def find_min(node)
      current = node
      current = current.left while current.left
      current
    end
    
    def display_recursive(node, prefix, is_left)
      puts "#{prefix}#{is_left ? '├── ' : '└── '}#{node.value}"
      
      if node.left || node.right
        if node.left
          display_recursive(node.left, "#{prefix}#{is_left ? '│   ' : '    '}", true)
        else
          puts "#{prefix}#{is_left ? '│   ' : '    '}├── nil"
        end
        
        if node.right
          display_recursive(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
        else
          puts "#{prefix}#{is_left ? '│   ' : '    '}└── nil"
        end
      end
    end
  end
end
