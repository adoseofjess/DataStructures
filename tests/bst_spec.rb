require 'rspec'
require_relative '../data_structures/bst'

describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new(5) }

  it 'has a root_node' do
    expect(tree.root_value).to eq(5)
  end

  it 'has a left subtree' do
    expect(tree.left).to eq(nil)
  end

  it 'has a right subtree' do
    expect(tree.right).to eq(nil)
  end

  context 'when there are nodes' do
  before do
    tree.insert(2)
    tree.insert(10)
    tree.insert(1)
    tree.insert(10)
  end

    describe "#insert" do
      it 'inserts a lesser value to the left of the root' do
        expect(tree.left.root_value).to eq(2)
      end

      it 'inserts another lesser value to the left of the root' do
        expect(tree.left.left.root_value).to eq(1)
      end

      it 'inserts a greater value to the right of the root' do
        expect(tree.right.root_value).to eq(10)
      end

      it 'inserts another greater value to the right of the root' do
        expect(tree.right.left.root_value).to eq(10)
      end
    end

    describe "#search_recursively" do
      it 'finds node to left of root node' do
        expect(tree.search_recursively(2)).to eq(true)
      end

      it 'finds node to right of root node' do
        expect(tree.search_recursively(10)).to eq(true)
      end

      it 'returns false for unfound node' do
        expect(tree.search_recursively(100)).to eq(false)
      end
    end

    describe "#find_min_iteratively" do
      let(:one_node_tree) { BinarySearchTree.new(5) }

      it 'finds the minimum value' do
        expect(tree.find_min_iteratively).to eq(1)
      end

      it 'finds the minimum value for a tree with one node' do
        expect(one_node_tree.find_min_iteratively).to eq(5)
      end
    end

    describe "#find_min_recursively" do
      let(:one_node_tree) { BinarySearchTree.new(5) }

      it 'finds the minimum value' do
        expect(tree.find_min_recursively).to eq(1)
      end

      it 'finds the minimum value for a tree with one node' do
        expect(one_node_tree.find_min_recursively).to eq(5)
      end
    end

    describe "#find_max_recursively" do
      let(:one_node_tree) { BinarySearchTree.new(5) }

      it 'finds the maximum value' do
        expect(tree.find_max_recursively).to eq(10)
      end

      it 'finds the maximum value for a tree with one node' do
        expect(one_node_tree.find_max_recursively).to eq(5)
      end
    end
  end
end