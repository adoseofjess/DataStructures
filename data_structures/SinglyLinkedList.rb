class Node
  attr_accessor :next, :data

  def initialize(params = {})
    args = {next: nil, data: nil}.merge(params)
    @next = args[:next]
    @data = args[:data]
  end
end

class SinglyLinkedList
  attr_accessor :beginning_node

  def initialize(node)
      @beginning_node = node
  end

  def add(new_node, index = nil)
    if index
      current_node = find(index)
    else
      #add to the end
      current_node = @beginning_node
  
      #find the last node 
      until current_node.next.nil?
        current_node = current_node.next    
      end
    end

    #found the last node
    #link the new node                  
    current_node.next = new_node 
  end
  
  def remove(node)
    if node == @beginning_node
    @beginning_node = @beginning_node.next
  else
    #find the node to remove
    previous_node = @beginning_node
    node_to_remove = @beginning_node.next
    
      until node_to_remove == node
        previous_node = previous_node.next
      node_to_remove.next
      end
    
    if node_to_remove.next
      previous_node.next = node_to_remove.next
    else
      previous_node.next = nil
    end
  end
  end

  # zero-based index
  def find(index)
    node = @beginning_node
    index.times do
      node = node.next
    end
    
    node
  end
end

node = Node.new({data: 0})
list = SinglyLinkedList.new(node)
list.add(Node.new({data: 1}))