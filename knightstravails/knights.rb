require_relative '../skeleton/lib/00_tree_node'
require 'byebug'

class KnightPathFinder

  attr_accessor :visited_positions, :tree

  def initialize
    @tree = [[0, 0]]
    @visited_positions = []
  end

  # def self.valid_moves(pos)
  #
  #   @visited_positions << pos


  def new_move_positions(pos)
    p pos
    value = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
    moves = value.map do |move|
      [pos[0] + move[0], pos[1] + move[1]]
    end
    p moves
    possible_moves = []
    moves.each { |pos|
      @visited_positions.include?(pos) || valid_move?(pos)  ? nil : possible_moves << pos }
    possible_moves
    p possible_moves
    possible_moves.each { |move| build_move_tree(move)}

  end

  def valid_move?(pos)
    pos[0] < 0 || pos[1] < 0
  end


  def build_move_tree (target)
    # debugger
    p target
      until @tree.first == target
        temp = @tree.shift
        p temp
        @visited_positions << temp
        @tree += new_move_positions(temp)
      end
  end
end
