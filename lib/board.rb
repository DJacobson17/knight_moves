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
    @squares.find { |s| s.name == name }
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

  def knight_moves(start, stop)
    k = bfs(start, stop)
    puts "Congrats! You made it in #{k.length - 1} moves!"
    k.each { |move| p move }
  end

  def bfs(start, stop)
    find_square_by_name(start).dist = 0
    queue = [find_square_by_name(start)]
    until queue.empty?
      current_node = queue.shift
      break if current_node.name == stop

      current_node.adj.each do |adj|
        square = find_square_by_name(adj)
        next unless square.dist.nil?

        square.dist = current_node.dist + 1
        square.pred = current_node
        queue << square
      end
    end
    display_path(current_node)
  end

  def display_path(stop)
    result = []
    queue = [stop.name]
    until queue.empty?
      current_node = find_square_by_name(queue.shift)
      current_node.pred && queue << current_node.pred.name
      result.unshift(current_node.name)
    end
    result
  end

end

