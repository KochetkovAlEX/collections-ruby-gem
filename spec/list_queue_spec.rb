# frozen_string_literal: true

require "spec_helper"

RSpec.describe Collections::LinkedList do
  let(:list) { described_class.new }

  describe "#initialize" do
    it "creates an empty list" do
      expect(list.empty?).to be true
      expect(list.size).to eq(0)
      expect(list.to_a).to eq([])
    end

    it "creates a list with initial data" do
      list_with_data = described_class.new(10)
      expect(list_with_data.to_a).to eq([10])
      expect(list_with_data.size).to eq(1)
    end
  end

  describe "#append" do
    it "appends elements to an empty list" do
      list.append(10)
      expect(list.to_a).to eq([10])
    end

    it "appends multiple elements" do
      list.append(10)
      list.append(20)
      list.append(30)
      expect(list.to_a).to eq([10, 20, 30])
    end

    it "appends nil values" do
      list.append(nil)
      list.append(20)
      expect(list.to_a).to eq([nil, 20])
    end

    it "appends different data types" do
      list.append(10)
      list.append("str")
      list.append([1, 2, 3])
      list.append({ key: "value" })
      expect(list.to_a).to eq([10, "str", [1, 2, 3], { key: "value" }])
    end
  end

  describe "#prepend" do
    it "prepends to empty list" do
      list.prepend(10)
      expect(list.to_a).to eq([10])
    end

    it "prepends to non-empty list" do
      list.append(20)
      list.append(30)
      list.prepend(10)
      expect(list.to_a).to eq([10, 20, 30])
    end

    it "prepends multiple times" do
      list.prepend(10)
      list.prepend(20)
      list.prepend(30)
      expect(list.to_a).to eq([30, 20, 10])
    end
  end
  
  describe "#insert_at" do
    before do
      list.append(10)
      list.append(20)
      list.append(30)
    end

    it "inserts at beginning" do
      list.insert_at(0, 5)
      expect(list.to_a).to eq([5, 10, 20, 30])
    end

    it "inserts at end" do
      list.insert_at(3, 40)
      expect(list.to_a).to eq([10, 20, 30, 40])
    end

    it "inserts in middle" do
      list.insert_at(2, 25)
      expect(list.to_a).to eq([10, 20, 25, 30])
    end

    it "raises error for negative index" do
      expect { list.insert_at(-1, 5) }.to raise_error(IndexError)
    end
  end

  describe "#delete_at" do
    before do
      list.append(10)
      list.append(20)
      list.append(30)
      list.append(40)
    end

    it "deletes from beginning" do
      deleted = list.delete_at(0)
      expect(deleted).to eq(10)
      expect(list.to_a).to eq([20, 30, 40])
    end

    it "deletes from end" do
      deleted = list.delete_at(3)
      expect(deleted).to eq(40)
      expect(list.to_a).to eq([10, 20, 30])
    end

    it "deletes from middle" do
      deleted = list.delete_at(2)
      expect(deleted).to eq(30)
      expect(list.to_a).to eq([10, 20, 40])
    end

    it "deletes last remaining element" do
      list = described_class.new(10)
      deleted = list.delete_at(0)
      expect(deleted).to eq(10)
      expect(list.to_a).to eq([])
      expect(list.empty?).to be true
    end

    it "raises error for negative index" do
      expect { list.delete_at(-1) }.to raise_error(IndexError, "Index -1 out of bounds")
    end

    it "returns correct value after deletion" do
      deleted = list.delete_at(1)
      expect(deleted).to eq(20)
      expect(list.find(20)).to be_nil
    end
  end

  describe "#at" do
    before do
      list.append(10)
      list.append(20)
      list.append(30)
    end

    it "returns element at valid index" do
      expect(list.at(0)).to eq(10)
      expect(list.at(1)).to eq(20)
      expect(list.at(2)).to eq(30)
    end

    it "raises error for negative index" do
      expect { list.at(-1) }.to raise_error(IndexError, "Index -1 out of bounds")
    end

    it "raises error for index out of bounds" do
      expect { list.at(3) }.to raise_error(IndexError, "Index 3 out of bounds")
    end

    it "raises error for empty list" do
      empty_list = described_class.new
      expect { empty_list.at(0) }.to raise_error(IndexError, "List is empty")
    end
  end

  describe "#find" do
    before do
      list.append(10)
      list.append(20)
      list.append(30)
      list.append(20)   #duplicate
    end

    it "returns node when element exists" do
      node = list.find(20)
      expect(node).to be_a(Collections::Node)
      expect(node.value).to eq(20)
    end

    it "returns first occurrence of duplicate" do
      node = list.find(20)
      expect(list.to_a.index(node.value)).to eq(1) 
    end

    it "returns nil when element not found" do
      expect(list.find(100)).to be_nil
    end

    it "returns nil for empty list" do
      empty_list = described_class.new
      expect(empty_list.find(10)).to be_nil
    end

    it "finds nil values" do
      list.append(nil)
      node = list.find(nil)
      expect(node.value).to be_nil
    end
  end

  describe "#size" do
    it "returns 0 for empty list" do
      expect(list.size).to eq(0)
    end

    it "returns correct size after appending" do
      list.append(10)
      expect(list.size).to eq(1)
      list.append(20)
      expect(list.size).to eq(2)
    end

    it "returns correct size after prepending" do
      list.prepend(10)
      expect(list.size).to eq(1)
      list.prepend(20)
      expect(list.size).to eq(2)
    end

    it "returns correct size after deleting" do
      list.append(10)
      list.append(20)
      list.append(30)
      list.delete_at(1)
      expect(list.size).to eq(2)
    end

    it "returns correct size after multiple operations" do
      list.append(10)
      list.prepend(20)
      list.insert_at(1, 7)
      list.delete_at(2)
      expect(list.size).to eq(2)
    end
  end

  describe "#empty?" do
    it "returns true for empty list" do
      expect(list.empty?).to be true
    end

    it "returns false for non-empty list" do
      list.append(10)
      expect(list.empty?).to be false
    end

    it "returns true after deleting all elements" do
      list.append(10)
      list.delete_at(0)
      expect(list.empty?).to be true
    end
  end

  describe "#to_a" do
    it "returns empty array for empty list" do
      expect(list.to_a).to eq([])
    end

    it "returns array with all elements" do
      list.append(10)
      list.append(20)
      list.append(30)
      expect(list.to_a).to eq([10, 20, 30])
    end

    it "returns independent array" do
      list.append(10)
      array = list.to_a
      array << 20
      expect(list.to_a).to eq([10])
    end
  end
end


RSpec.describe Collections::Queue do
  let(:queue) { described_class.new }

  describe "#initialize" do
    it "creates an empty queue" do
      expect(queue.empty?).to be true
      expect(queue.size).to eq(0)
      expect(queue.top).to be_nil
    end
  end

  describe "#enqueue" do
    context "when queue is empty" do
      it "adds element and sets top" do
        queue.enqueue(10)
        expect(queue.front).to eq(10)
        expect(queue.size).to eq(1)
        expect(queue.is_empty).to be false
      end
    end

    context "when queue has elements" do
      before do
        queue.enqueue(10)
        queue.enqueue(20)
      end

      it "adds element to the end" do 
        queue.enqueue(30)
        expect(queue.front).to eq(10)
        expect(queue.size).to eq(3)

        # Verify order
        expect(queue.dequeue).to eq(10)
        expect(queue.dequeue).to eq(20)
        expect(queue.dequeue).to eq(30)
      end
    end

    it "handles different data types" do
      queue.enqueue("str")
      queue.enqueue([1, 2, 3])
      queue.enqueue(10)
      queue.enqueue({ key: "value" })
      expect(queue.size).to eq(4)
      expect(queue.front).to eq("str")
    end

    it "handles nil value" do
      queue.enqueue(nil)
      expect(queue.front).to be_nil
      expect(queue.size).to eq(1)
    end
  end

  describe "#dequeue" do
    context "when queue has elements" do
      before do
        queue.enqueue(10)
        queue.enqueue(20)
        queue.enqueue(30)
      end

      it "removes and returns the front element" do
        expect(queue.dequeue).to eq(10)
        expect(queue.front).to eq(20)
        expect(queue.size).to eq(2)
      end

      it "returns elements in FIFO order" do
        expect(queue.dequeue).to eq(10)
        expect(queue.dequeue).to eq(20)
        expect(queue.dequeue).to eq(30)
        expect(queue.is_empty).to be true
      end
    end

    context "when queue has one element" do
      before { queue.enqueue(15) }

      it "removes element and sets top to nil" do
        expect(queue.dequeue).to eq(15)
        expect(queue.top).to be_nil
        expect(queue.is_empty).to be true
      end
    end
  end

  describe "#front" do
    it "returns front element without removing it" do
      queue.enqueue(10)
      queue.enqueue(20)
      expect(queue.front).to eq(10)
      expect(queue.size).to eq(2)
    end

    it "returns nil for empty queue" do
      expect(queue.front).to be_nil
    end
  end

  describe "#clear" do
    before do
      queue.enqueue(10)
      queue.enqueue(20)
      queue.enqueue(30)
    end

    it "removes all elements" do
      queue.clear
      expect(queue.is_empty).to be true
      expect(queue.size).to eq(0)
      expect(queue.top).to be_nil
    end
  end

  describe "#set_top" do
    before do
      queue.enqueue(10)
      queue.enqueue(20)
    end

    it "changes the top value" do
      queue.set_top(99)
      expect(queue.top).to eq(99)
      expect(queue.front).to eq(99)
      expect(queue.size).to eq(2)
    end

    it "modifies the underlying array" do
      queue.set_top(99)
      expect(queue.dequeue).to eq(99)
      expect(queue.dequeue).to eq(20)
    end
  end

  describe "#set_queue" do
    context "with non-empty array" do
      let(:arr) { [1, 2, 3, 4, 5] }

      it "sets queue from array" do
        queue.set_queue(arr)
        expect(queue.size).to eq(5)
        expect(queue.top).to eq(1)
        
        #Verify order
        expect(queue.dequeue).to eq(1)
        expect(queue.dequeue).to eq(2)
      end

      it "replaces existing queue" do
        queue.enqueue(100)
        queue.enqueue(200)
        queue.set_queue(arr)
        
        expect(queue.size).to eq(5)
        expect(queue.front).to eq(1)
      end
    end

    context "with empty array" do
      it "does nothing" do
        queue.enqueue(10)
        queue.set_queue([])
        expect(queue.size).to eq(1)
      end
    end
  end

  describe "#insert" do
    before do
      queue.enqueue(10)
      queue.enqueue(20)
      queue.enqueue(30)
    end

    context "with valid index" do
      it "inserts at beginning" do
        queue.insert(5, 0)
        expect(queue.front).to eq(5)
        expect(queue.dequeue).to eq(5)
        expect(queue.dequeue).to eq(10)
      end

      it "inserts in the middle" do
        queue.insert(25, 2)
        expect(queue.dequeue).to eq(10)
        expect(queue.dequeue).to eq(20)
        expect(queue.dequeue).to eq(25)
        expect(queue.dequeue).to eq(30)
      end

      it "inserts at the end" do
        queue.insert(40, 3)
        expect(queue.dequeue).to eq(10)
        expect(queue.dequeue).to eq(20)
        expect(queue.dequeue).to eq(30)
        expect(queue.dequeue).to eq(40)
      end
    end

    context "with invalid index" do
      it "raises IndexError for negative index" do
        expect { queue.insert(5, -1) }.to raise_error(IndexError)
      end

      it "raises IndexError for index greater than size" do
        expect { queue.insert(5, 10) }.to raise_error(IndexError)
      end
    end

    context "with empty queue" do
      let(:empty_queue) { described_class.new }

      it "inserts at index 0" do
        empty_queue.insert(10, 0)
        expect(empty_queue.front).to eq(10)
        expect(empty_queue.size).to eq(1)
      end

      it "raises error for index > 0" do
        expect { empty_queue.insert(10, 1) }.to raise_error(IndexError)
      end
    end
  end

  describe "#contains" do
    before do
      queue.enqueue(10)
      queue.enqueue(20)
      queue.enqueue(30)
    end

    it "returns true when element exists" do
      expect(queue.contains(20)).to be true
    end

    it "returns false when element does not exist" do
      expect(queue.contains(100)).to be false
    end
  end

  describe "#index" do
    before do
      queue.enqueue(10)
      queue.enqueue(20)
      queue.enqueue(30)
    end

    it "returns correct index for existing element" do
      expect(queue.index(10)).to eq(0)
      expect(queue.index(20)).to eq(1)
      expect(queue.index(30)).to eq(2)
    end

    it "returns -1 for non-existing element" do
      expect(queue.index(100)).to eq(-1)
    end

    it "returns first occurrence for duplicate elements" do
      queue.enqueue(20)
      expect(queue.index(20)).to eq(1)
    end
  end

  describe "#to_a" do
    it "returns array representation" do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
      expect(queue.to_a).to eq([1, 2, 3])
    end

    it "returns empty array for empty queue" do
      expect(queue.to_a).to eq([])
    end

    it "returns a copy, not the internal array" do
      queue.enqueue(1)
      arr = queue.to_a
      arr << 2
      expect(queue.size).to eq(1)
      expect(queue.to_a).to eq([1])
    end
  end

  describe "#size" do
    it "returns correct size" do
      expect(queue.size).to eq(0)
      queue.enqueue(1)
      expect(queue.size).to eq(1)
      queue.enqueue(2)
      expect(queue.size).to eq(2)
      queue.dequeue
      expect(queue.size).to eq(1)
    end
  end

  describe "#empty?" do
    it "returns true for empty queue" do
      expect(queue.empty?).to be true
    end

    it "returns false for non-empty queue" do
      queue.enqueue(1)
      expect(queue.empty?).to be false
    end

    it "is aliased to is_empty" do
      expect(queue.method(:empty?)).to eq(queue.method(:is_empty))
    end
  end

  describe "#to_s" do
    before do
      queue.enqueue(1)
      queue.enqueue(2)
      queue.enqueue(3)
    end

    it "returns a Stack object" do
      result = queue.to_s
      expect(result).to be_a(Stack) if defined?(Stack)
    end
  end
end
