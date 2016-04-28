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

  describe "#insert" do
    before do
      tree.insert(2)
      tree.insert(10)
    end

    it 'inserts a lesser value to the left of the root' do
      expect(tree.left.root_value).to eq(2)
    end

    it 'inserts a lesser value to the left of the root' do
      expect(tree.right.root_value).to eq(10)
    end
  end
end