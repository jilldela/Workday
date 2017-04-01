require "byebug"

class PolyTreeNode
  attr_reader :parent, :children, :value

  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end

  def parent
    @parent
  end

  def parent=(parent)
    @parent.children.reject! {|el| el == self } unless @parent.nil?
    @parent = parent
    if @parent.nil?
      nil
    else
      @parent.children << self unless @parent.children.include?(self)
    end
    @parent
  end

  def add_child(child_node)
    self.children << child_node
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise Exception unless self.children.include?(child_node)
    self.children - [child_node]
    child_node.parent=(nil)
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      child_search = child.dfs(target_value)
      return child_search unless child_search.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      first = queue.shift
      return first if first.value == target_value
      queue.concat(first.children)
    end

    nil
  end
end
