require_relative 'square'
require 'pry-byebug'

class Board # rubocop:disable Style/Documentation
  attr_accessor :squares

  def initialize
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    array = a.product(a)
    @squares = []
    build_board(array)
    connect_neighbors
  end

  def add_square(name)
    @squares.push(Square.new(name))
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

  def add_edge(start_name, end_name, undirected: true)
    from = squares.index { |s| s.name == start_name }
    to   = squares.index { |s| s.name == end_name }
    # binding.pry
    squares[from].neighbors[to] = true
    squares[to].neighbors[from] = true if undirected
  end

  def build_board(array)
    array.each { |name| add_square(name) }
  end

  def connect_neighbors
    @squares.each { |square| calculate_neighbors(square) }
  end

  def calculate_neighbors(square)
    array = square.name.dup
    array[0] -= 1
    array[1] += 2
    add_edge(square.name, array) if find_square_by_name(array)
    array[1] -= 4
    add_edge(square.name, array) if find_square_by_name(array)
    array[0] -= 1
    array[1] += 1
    add_edge(square.name, array) if find_square_by_name(array)
    array[1] += 2
    add_edge(square.name, array) if find_square_by_name(array)
    array[0] += 4
    add_edge(square.name, array) if find_square_by_name(array)
    array[1] -= 2
    add_edge(square.name, array) if find_square_by_name(array)
    array[0] -= 1
    array[1] -= 1
    add_edge(square.name, array) if find_square_by_name(array)
    array[1] += 4
    add_edge(square.name, array) if find_square_by_name(array)
  end
end

b = Board.new
s = b.find_square_by_name([1, 4])
p s
