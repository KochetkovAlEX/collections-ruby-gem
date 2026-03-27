# frozen_string_literal: true

require "spec_helper"

RSpec.describe Collections::Tree do
  let(:tree) { described_class.new }

  # 1. Конструктор
  it "creates empty tree" do
    expect(tree.root).to be_nil
  end

  # 2. Метод класса with_root
  it "creates tree with a root" do
    tree = described_class.with_root(10)
    expect(tree.root.value).to eq(10)
  end

  # 3. Метод класса build
  it "builds tree from block" do
    tree = described_class.build do
      add(5)
      add(3)
      add(7)
    end
    expect(tree.root.value).to eq(5)
    expect(tree.root.left.value).to eq(3)
    expect(tree.root.right.value).to eq(7)
  end

  # 4. Метод класса from_values
  it "creates tree from values" do
    tree = described_class.from_values(8, 3, 10, 1, 6)
    expect(tree.root.value).to eq(8)
    expect(tree.root.left.value).to eq(3)
    expect(tree.root.right.value).to eq(10)
  end

  # 5. Метод add
  it "adds elements to the tree" do
    tree.add(5)
    tree.add(3)
    tree.add(7)
    expect(tree.root.value).to eq(5)
    expect(tree.root.left.value).to eq(3)
    expect(tree.root.right.value).to eq(7)
  end

  # 6. Метод delete (все три сценария в одном тесте)
  it "deletes elements correctly" do
    # Подготовка дерева
    tree = described_class.from_values(10, 5, 15, 3, 7, 12, 18)

    # Удаление листа
    tree.delete(3)
    expect(tree.root.left.left).to be_nil

    # Удаление узла с одним потомком
    tree = described_class.from_values(10, 5, 15, 3)  # у 5 только левый потомок
    tree.delete(5)
    expect(tree.root.left.value).to eq(3)

    # Удаление узла с двумя потомками
    tree = described_class.from_values(10, 5, 15, 3, 7, 12, 18)
    tree.delete(10)
    expect(tree.root.value).to eq(12)
    expect(tree.root.left.value).to eq(5)
    expect(tree.root.right.value).to eq(15)
  end

  # 7. Метод display (без ошибок)
  it "displays tree without errors" do
    tree.add(2)
    tree.add(1)
    tree.add(3)
    expect { tree.display }.not_to raise_error
  end

  # 8. Аксессор root (чтение/запись)
  it "allows reading and writing root" do
    node = Collections::BinaryNode.new(42)
    tree.root = node
    expect(tree.root).to eq(node)
    expect(tree.root.value).to eq(42)
  end
end