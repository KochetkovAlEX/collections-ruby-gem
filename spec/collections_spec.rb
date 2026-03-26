# frozen_string_literal: true

require "spec_helper"

RSpec.describe Collections do
  it "has a version number" do
    expect(Collections::VERSION).not_to be nil
  end
end

RSpec.describe Collections::Stack do
  let(:stack) { described_class.new }

  it "pushes and pops items" do
    stack.push(1)
    stack.push(2)
    expect(stack.pop).to eq(2)
    expect(stack.pop).to eq(1)
  end

  it "returns top item with peek" do
    stack.push(1)
    stack.push(2)
    expect(stack.peek).to eq(2)
    expect(stack.size).to eq(2)
  end

  it "is empty when created" do
    expect(stack.is_empty).to be true
  end

  it "sets peek value" do
    stack.push(5)
    stack.set_peek(10)
    expect(stack.peek).to eq(10)
  end

  it "sets stack from array" do
    stack.set_stack([1, 2, 3])
    expect(stack.to_a).to eq([1, 2, 3])
    expect(stack.peek).to eq(3)
  end

  it "clears stack" do
    stack.push(1)
    stack.push(2)
    stack.clear
    expect(stack.is_empty).to be true
  end

  it "inserts element at index" do
    stack.push(1)
    stack.push(2)
    stack.insert(5, 1)
    expect(stack.to_a).to eq([1, 5, 2])
  end

  it "checks if contains element" do
    stack.push(1)
    stack.push(2)
    expect(stack.contains(1)).to be true
    expect(stack.contains(99)).to be false
  end

  it "finds index of element from TOS" do
    stack.push(1)
    stack.push(2)
    stack.push(3)
    expect(stack.index(2)).to eq(1)
    expect(stack.index(99)).to eq(-1)
  end

  it "converts to array" do
    stack.push(1)
    stack.push(2)
    stack.push(3)
    expect(stack.to_a).to eq([1, 2, 3])
  end

  it "converts to queue" do
    stack.push(1)
    stack.push(2)
    q = stack.to_q
    expect(q).to be_a(Collections::Queue)
  end
end

RSpec.describe Collections::Queue do
  let(:queue) { described_class.new }

  it "enqueues and dequeues items" do
    queue.enqueue(:first)
    queue.enqueue(:second)
    expect(queue.dequeue).to eq(:first)
    expect(queue.dequeue).to eq(:second)
  end

  it "returns first item with front" do
    queue.enqueue(1)
    queue.enqueue(2)
    expect(queue.front).to eq(1)
    expect(queue.size).to eq(2)
  end

  it "is empty when created" do
    expect(queue.is_empty).to be true
  end

  it "sets top value" do
    queue.enqueue(5)
    queue.set_top(10)
    expect(queue.front).to eq(10)
  end

  it "sets queue from array" do
    queue.set_queue([1, 2, 3])
    expect(queue.to_a).to eq([1, 2, 3])
    expect(queue.front).to eq(1)
  end

  it "clears queue" do
    queue.enqueue(1)
    queue.enqueue(2)
    queue.clear
    expect(queue.is_empty).to be true
  end

  it "inserts element at index" do
    queue.enqueue(1)
    queue.enqueue(2)
    queue.insert(5, 1)
    expect(queue.to_a).to eq([1, 5, 2])
  end

  it "checks if contains element" do
    queue.enqueue(1)
    queue.enqueue(2)
    expect(queue.contains(1)).to be true
    expect(queue.contains(99)).to be false
  end

  it "finds index of element" do
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    expect(queue.index(2)).to eq(1)
    expect(queue.index(99)).to eq(-1)
  end

  it "converts to array" do
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    expect(queue.to_a).to eq([1, 2, 3])
  end

  it "converts to stack" do
    queue.enqueue(1)
    queue.enqueue(2)
    s = queue.to_s
    expect(s).to be_a(Collections::Stack)
  end
end

RSpec.describe Collections::LinkedList do
  let(:list) { described_class.new }

  it "appends items" do
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.to_a).to eq([1, 2, 3])
  end

  it "prepends items" do
    list.append(1)
    list.prepend(0)
    expect(list.to_a).to eq([0, 1])
  end

  it "inserts at index" do
    list.append(1)
    list.append(3)
    list.insert_at(1, 2)
    expect(list.to_a).to eq([1, 2, 3])
  end

  it "deletes at index" do
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.delete_at(1)).to eq(2)
    expect(list.to_a).to eq([1, 3])
  end

  it "finds node by value" do
    list.append(10)
    list.append(20)
    list.append(30)
    node = list.find(20)
    expect(node.value).to eq(20)
    expect(list.find(99)).to be_nil
  end

  it "gets element at index" do
    list.append(10)
    list.append(20)
    list.append(30)
    expect(list.at(0)).to eq(10)
    expect(list.at(1)).to eq(20)
  end

  it "returns size" do
    expect(list.size).to eq(0)
    list.append(1)
    list.append(2)
    expect(list.size).to eq(2)
  end

  it "is empty when created" do
    expect(list.empty?).to be true
    list.append(1)
    expect(list.empty?).to be false
  end

  it "converts to array" do
    list.append(1)
    list.append(2)
    list.append(3)
    expect(list.to_a).to eq([1, 2, 3])
  end

  it "initializes with data" do
    list_with_data = Collections::LinkedList.new(42)
    expect(list_with_data.to_a).to eq([42])
  end

  it "initializes without data" do
    empty_list = Collections::LinkedList.new
    expect(empty_list.to_a).to eq([])
  end
end

RSpec.describe Collections::Tree do
  let(:tree) { described_class.new }

  it "adds items" do
    tree.add(5)
    tree.add(3)
    tree.add(7)
    expect(tree.root).not_to be_nil
    expect(tree.root.value).to eq(5)
  end

  it "deletes items" do
    tree.add(5)
    tree.add(3)
    tree.add(7)
    tree.delete(3)
    expect(tree.root.left).to be_nil
  end

  it "creates tree with root" do
    tree = Collections::Tree.with_root(10)
    expect(tree.root.value).to eq(10)
  end

  it "builds tree with block" do
    tree = Collections::Tree.build do
      add(5)
      add(3)
      add(7)
    end
    expect(tree.root.value).to eq(5)
  end

  it "creates tree from values" do
    tree = Collections::Tree.from_values(5, 3, 7, 1)
    expect(tree.root.value).to eq(5)
  end

  it "displays tree" do
    tree.add(2)
    tree.add(1)
    tree.add(56)
    expect { tree.display }.not_to raise_error
  end
end

RSpec.describe Collections::BinaryNode do
  it "creates node with value" do
    node = Collections::BinaryNode.new(5)
    expect(node.value).to eq(5)
    expect(node.left).to be_nil
    expect(node.right).to be_nil
  end

  it "checks if node is leaf" do
    node = Collections::BinaryNode.new(5)
    expect(node.leaf?).to be true
    node.left = Collections::BinaryNode.new(3)
    expect(node.leaf?).to be false
  end

  it "converts to string" do
    node = Collections::BinaryNode.new(42)
    expect(node.to_s).to eq("42")
  end
end
