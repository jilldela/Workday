require_relative "00_tree_node"

class KnightPathFinder
  def initialize(pos)
    @pos = pos
    @board = Array.new(8) { Array.new(8) }
    @path = [pos]
  end

end
