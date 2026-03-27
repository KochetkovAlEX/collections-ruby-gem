# frozen_string_literal: true

require "spec_helper"

RSpec.describe Collections::Stack do
  let(:stack) { described_class.new }

  it "is empty when created" do
    expect(stack.is_empty).to be true
    expect(stack.empty?).to be true
  end

  it "pushes items and updates size and peek" do
    stack.push(10)
    stack.push(20)
    expect(stack.size).to eq(2)
    expect(stack.peek).to eq(20)
  end

  it "pops items in LIFO order" do
    stack.push(5)
    stack.push(15)
    expect(stack.pop).to eq(15)
    expect(stack.size).to eq(1)
    expect(stack.peek).to eq(5)
  end

  it "returns nil when popping empty stack" do
    expect(stack.pop).to be_nil
    expect(stack.size).to eq(0)
    expect(stack.peek).to be_nil
  end

  it "clears all elements" do
    stack.push(1)
    stack.push(2)
    stack.clear
    expect(stack.size).to eq(0)
    expect(stack.peek).to be_nil
  end

  it "sets new peek value on empty stack" do
    stack.set_peek(100)
    expect(stack.peek).to eq(100)
    expect(stack.size).to eq(1)
    expect(stack.to_a).to eq([100])
  end

  it "replaces top element with set_peek" do
    stack.push(10)
    stack.set_peek(99)
    expect(stack.peek).to eq(99)
    expect(stack.size).to eq(1)
    expect(stack.to_a).to eq([99])
  end

  it "loads stack from array with set_stack" do
    stack.set_stack([1, 2, 3])
    expect(stack.size).to eq(3)
    expect(stack.peek).to eq(3)
    expect(stack.to_a).to eq([1, 2, 3])
  end

  it "inserts element at valid positions" do
    stack.push(1)
    stack.push(3)
    stack.insert(2, 1)          # insert middle
    stack.insert(0, 0)          # insert beginning
    stack.insert(4, stack.size) # insert end
    expect(stack.to_a).to eq([0, 1, 2, 3, 4])
  end

  it "raises IndexError when inserting at invalid index" do
    stack.push(1)
    expect { stack.insert(99, 5) }.to raise_error(IndexError)
  end

  it "checks if contains element" do
    stack.push(10)
    stack.push(20)
    expect(stack.contains(10)).to be true
    expect(stack.contains(99)).to be false
  end

  it "returns index from top of stack" do
    stack.push(10)
    stack.push(20)
    stack.push(30)   # TOS = 30
    expect(stack.index(30)).to eq(0)
    expect(stack.index(20)).to eq(1)
    expect(stack.index(10)).to eq(2)
    expect(stack.index(99)).to eq(-1)
  end

  it "returns copy of internal array with to_a" do
    stack.push(:a)
    stack.push(:b)
    arr = stack.to_a
    expect(arr).to eq([:a, :b])
    expect(arr.object_id).not_to eq(stack.instance_variable_get(:@stack).object_id)
  end

  it "converts to queue with to_q" do
    stack.push(1)
    stack.push(2)
    queue = stack.to_q
    expect(queue).to be_a(Collections::Queue)
    expect(queue.size).to eq(2)
  end

  it "prints stack without errors" do
    stack.push(1)
    stack.push(2)
    expect { stack.print }.not_to raise_error
  end

  it "handles interleaved push/pop" do
    stack.push(5)
    stack.pop
    stack.push(10)
    expect(stack.size).to eq(1)
    expect(stack.peek).to eq(10)
  end

  it "handles large number of pushes" do
    1000.times { |i| stack.push(i) }
    expect(stack.size).to eq(1000)
    expect(stack.peek).to eq(999)
  end
end