require 'rspec'
require_relative '../data_structures/bst'

describe BinarySearchTree do
  let(:empty_tree) { BinarySearchTree.new(5) }
  let(:tree) { BinarySearchTree.new(5) }
  let(:tall_tree) { BinarySearchTree.new(5) }

  before do
    tall_tree.insert(2)
    tall_tree.insert(12)
    tall_tree.insert(1)
    tall_tree.insert(7)
    tall_tree.insert(10)
  end

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

    describe "#search_iteratively" do
      it 'finds node to left of root node' do
        expect(tree.search_iteratively(2)).to eq(true)
      end

      it 'finds node to right of root node' do
        expect(tree.search_iteratively(10)).to eq(true)
      end

      it 'returns false for unfound node' do
        expect(tree.search_iteratively(100)).to eq(false)
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
      it 'finds the maximum value' do
        expect(tree.find_max_recursively).to eq(10)
      end

      it 'finds the maximum value for a tree with one node' do
        expect(empty_tree.find_max_recursively).to eq(5)
      end
    end

    describe "#find_height" do
      it 'returns 0 for an empty tree' do
        expect(empty_tree.find_height).to eq(0)
      end

      it 'finds the height of a tree' do
        expect(tall_tree.find_height).to eq(3)
      end
    end

    describe "#level_order_traversal" do
      it 'visits nodes in order of level' do
        expect(tall_tree.level_order_traversal).to eq([5,2,12,1,7,10])
      end
    end

    describe "#pre_order_traversal" do
      it 'visits nodes in right order' do
        expect(tall_tree.pre_order_traversal).to eq([5,2,1,12,7,10])
      end
    end

    describe "#in_order_traversal" do
      it 'visits nodes in right order' do
        expect(tall_tree.in_order_traversal).to eq([1,2,5,7,10,12])
      end
    end

    describe "#post_order_traversal" do
      it 'visits nodes in right order' do
        expect(tall_tree.post_order_traversal).to eq([1,2,10,7,12,5])
      end
    end
  end
end