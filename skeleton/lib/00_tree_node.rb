require 'byebug'

class PolyTreeNode
  attr_reader :children, :parent
  attr_accessor :value

  def initialize(value = nil)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(new_parent)
    @parent.children.delete(self) unless @parent == nil
    @parent = new_parent
    unless parent.nil?
      @parent.children << self unless @parent.children.include?(self)
    end
  end

  def add_child(new_child)
    new_child.parent= self
  end

  def remove_child(child)
    raise "not a child" if child.parent.nil?
    child.parent= nil
  end


  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      temp = queue.shift
      return temp if temp.value == target_value
      queue += temp.children
    end
  end
end
