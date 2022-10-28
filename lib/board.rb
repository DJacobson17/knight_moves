require_relative 'square'
require 'pry-byebug'

class Board # rubocop:disable Style/Documentation
  attr_accessor :squares, :children

  def initialize
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    array = a.product(a)
    @squares = build_board(array)
  end

  def find_square_by_name(name)
    squares.each do |s|
      return s if s.name == name
    end
    nil
  end

  def count
    squares.length
  end

  def build_board(array)
    result = []
    array.each do |name| 
      new_square = Square.new(name)
      new_square.adj = calculate_adjacents(name)
      result << new_square
    end
    result
  end

  def calculate_adjacents(square)
    arr = []
    shift = [[-2, -1], [+2, -1], [-2, +1], [+2, +1], [-1, +2], [-1, -2], [+1, +2], [+1, -2]]
    shift.each do |move|
      x = square[0] + move[0]
      y = square[1] + move[1]
      arr << [x, y]
    end
    valid(arr)
  end

  def valid(adj)
    adj.select { |position| position[0].between?(1, 8) && position[1].between?(1, 8)}
  end


  def knight_moves(init, dest, result = [])
    start_node = find_square_by_name(init)
    end_node = find_square_by_name(dest)
    return result if init.nil?
    
    calculate_children(start_node)
    start_node.children.each { |child| result << child }
    knight_moves(child, dest, )
  end

end

b = Board.new
p b
