class BinarySearchTree
  attr_accessor :parent, :root_value, :left, :right

  def initialize(root_value, parent=nil, left=nil, right=nil)
    @parent = parent
    @root_value = root_value
    @left = left
    @right = right
  end

  def insert(value)
    if value > @root_value
      @right ? @right.insert(value) : @right = BinarySearchTree.new(value, self)
    else
      @left ? @left.insert(value) : @left = BinarySearchTree.new(value, self)
    end
    
    self
  end

  def search_recursively(value)
    return true if @root_value == value

    if value <= @root_value
      @left ? @left.search_recursively(value) : false
    else
      @right ? @right.search_recursively(value) : false
    end
  end

  def search_iteratively(value)
  end

  def delete(value)
  end

  # def inspect
  #   "tree"
  # end
end