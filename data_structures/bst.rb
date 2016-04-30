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
    current_node = self
    while !current_node.nil?
      if value < current_node.root_value
        current_node = current_node.left
      elsif value > current_node.root_value
        current_node = current_node.right
      else 
        return true
      end
    end

    return false
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

  def find_height
    return 0 if (@left.nil? && @right.nil?)

    left_height = (@left ? @left.find_height : 0)
    right_height = (@right ? @right.find_height : 0)
    1 + (left_height >= right_height ? left_height : right_height)
  end

  # breadth first strategy for visiting all nodes by level
  def level_order_traversal
    nodes_to_visit = []
    visited_nodes = []
    
    nodes_to_visit.push(self)
    
    while !nodes_to_visit.empty?
      node_to_visit = nodes_to_visit.shift
      visited_nodes.push(node_to_visit.root_value)

      nodes_to_visit.push(node_to_visit.left) if node_to_visit.left
      nodes_to_visit.push(node_to_visit.right) if node_to_visit.right
    end

    visited_nodes
  end

  # depth first strategy for visiting nodes by root, left, right order
  def pre_order_traversal
    nodes = []
    nodes.push(@root_value)
    nodes += @left.pre_order_traversal if @left
    nodes += @right.pre_order_traversal if @right
    nodes
  end

  # depth first strategy for visiting nodes by left, root, right order
  def in_order_traversal
    nodes = []
    nodes += @left.in_order_traversal if @left
    nodes.push(@root_value)
    nodes += @right.in_order_traversal if @right
    nodes
  end

  # depth first strategy for visiting nodes by left, root, right order
  def post_order_traversal
    nodes = []
    nodes += @left.post_order_traversal if @left
    nodes += @right.post_order_traversal if @right
    nodes.push(@root_value)
    nodes
  end
end