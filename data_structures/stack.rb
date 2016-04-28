class Stack
  def initialize
    @stack = []
  end

  def push(data)
    @stack.push(data)
  end

  def pop
    @stack.delete(@stack.last)
  end

  def empty?
    @stack.empty?
  end

  def top
    @stack.last
  end
end