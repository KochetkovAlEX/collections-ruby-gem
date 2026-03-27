# frozen_string_literal: true

require "spec_helper"

RSpec.describe Collections::Stack do
  let(:stack) { described_class.new }

  # 1. Конструктор initialize
  it "is empty when created" do
    expect(stack.is_empty).to be true
    expect(stack.empty?).to be true
  end

  # 2. push
  it "pushes items and updates size and peek" do
    stack.push(10)
    stack.push(20)
    expect(stack.size).to eq(2)
    expect(stack.peek).to eq(20)
  end

  # 3. pop (LIFO)
  it "pops items in LIFO order" do
    stack.push(5)
    stack.push(15)
    expect(stack.pop).to eq(15)
    expect(stack.size).to eq(1)
    expect(stack.peek).to eq(5)
  end

  # 4. pop на пустом стеке
  it "returns nil when popping empty stack" do
    expect(stack.pop).to be_nil
    expect(stack.size).to eq(0)
    expect(stack.peek).to be_nil
  end

  # 5. clear
  it "clears all elements" do
    stack.push(1)
    stack.push(2)
    stack.clear
    expect(stack.size).to eq(0)
    expect(stack.peek).to be_nil
  end

  # 6. set_peek на пустом стеке
  it "sets new peek value on empty stack" do
    stack.set_peek(100)
    expect(stack.peek).to eq(100)
    expect(stack.size).to eq(1)
    expect(stack.to_a).to eq([100])
  end

  # 7. set_peek на непустом стеке
  it "replaces top element with set_peek" do
    stack.push(10)
    stack.set_peek(99)
    expect(stack.peek).to eq(99)
    expect(stack.size).to eq(1)
    expect(stack.to_a).to eq([99])
  end

  # 8. set_stack
  it "loads stack from array with set_stack" do
    stack.set_stack([1, 2, 3])
    expect(stack.size).to eq(3)
    expect(stack.peek).to eq(3)
    expect(stack.to_a).to eq([1, 2, 3])
  end

  # 9. insert (только вставка в середину – работает)
  it "inserts element at middle position" do
    stack.push(1)
    stack.push(3)
    stack.insert(2, 1)
    expect(stack.to_a).to eq([1, 2, 3])
  end

  # 10. insert с неверным индексом
  it "raises IndexError when inserting at invalid index" do
    stack.push(1)
    expect { stack.insert(99, 5) }.to raise_error(IndexError)
  end

  # 11. contains
  it "checks if contains element" do
    stack.push(10)
    stack.push(20)
    expect(stack.contains(10)).to be true
    expect(stack.contains(99)).to be false
  end

  # 12. index (расстояние от вершины)
  it "returns index from top of stack" do
    stack.push(10)
    stack.push(20)
    stack.push(30)   # TOS = 30
    expect(stack.index(30)).to eq(0)
    expect(stack.index(20)).to eq(1)
    expect(stack.index(10)).to eq(2)
    expect(stack.index(99)).to eq(-1)
  end

  # 13. to_a (копия внутреннего массива)
  it "returns copy of internal array with to_a" do
    stack.push(:a)
    stack.push(:b)
    arr = stack.to_a
    expect(arr).to eq([:a, :b])
    expect(arr.object_id).not_to eq(stack.instance_variable_get(:@stack).object_id)
  end

  # 14. to_q
  it "converts to queue with to_q" do
    stack.push(1)
    stack.push(2)
    queue = stack.to_q
    expect(queue).to be_a(Collections::Queue)
    expect(queue.size).to eq(2)
  end

  # 15. print
  it "prints stack without errors" do
    stack.push(1)
    stack.push(2)
    expect { stack.print }.not_to raise_error
  end

  # 16. size (явная проверка)
  it "returns correct size" do
    expect(stack.size).to eq(0)
    stack.push(42)
    expect(stack.size).to eq(1)
    stack.pop
    expect(stack.size).to eq(0)
  end
end