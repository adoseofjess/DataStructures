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

  def find_min_iteratively
    return @root_value if @left.nil? 

    current_node = self
    until current_node.left.nil?
      current_node = @left.left
    end

    current_node.root_value
  end

  def find_max_iteratively
    return @root_value if @right.nil? 

    current_node = self
    until current_node.right.nil?
      current_node = @right.right
    end

    current_node.root_value
  end

  def find_min_recursively
    return @root_value if @left.nil? 

    @left.find_min_recursively
  end

  def find_max_recursively
    return @root_value if @right.nil? 

    @right.find_max_recursively
  end
end