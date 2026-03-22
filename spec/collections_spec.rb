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

  it "returns last item with peek" do
    stack.push(1)
    stack.push(2)
    expect(stack.peek).to eq(2)
    expect(stack.size).to eq(2)
  end

  it "is empty when created" do
    expect(stack).to be_empty
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
    expect(queue).to be_empty
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

  it "finds item index" do
    list.append(10)
    list.append(20)
    list.append(30)
    expect(list.find(20)).to eq(1)
    expect(list.find(99)).to be_nil
  end

  it "returns size" do
    expect(list.size).to eq(0)
    list.append(1)
    list.append(2)
    expect(list.size).to eq(2)
  end

  it "is empty when created" do
    expect(list).to be_empty
  end
end

RSpec.describe Collections::BinarySearchTree do
  let(:tree) { described_class.new }

  it "inserts and searches items" do
    tree.insert(5)
    tree.insert(3)
    tree.insert(7)
    expect(tree.search(3)).to be true
    expect(tree.search(99)).to be false
  end

  it "returns inorder traversal" do
    tree.insert(5)
    tree.insert(3)
    tree.insert(7)
    tree.insert(1)
    expect(tree.inorder).to eq([1, 3, 5, 7])
  end

  it "deletes items" do
    tree.insert(5)
    tree.insert(3)
    tree.insert(7)
    tree.delete(3)
    expect(tree.search(3)).to be false
    expect(tree.inorder).to eq([5, 7])
  end

  it "is empty when created" do
    expect(tree).to be_empty
  end
end
