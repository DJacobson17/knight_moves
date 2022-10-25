require_relative 'square'
require 'pry-byebug'

class Board # rubocop:disable Style/Documentation
  attr_accessor :squares

  def initialize
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    array = a.product(a)
    @squares = []
    build_board(array)
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

  def add_edge(start_name, end_name)
    find_square_by_name(start_name).children.push(find_square_by_name(end_name))
  end

  def build_board(array)
    array.each { |name| add_square(name) }
  end


  def calculate_children(square)
    current_square = square.name.dup
    current_square[0] -= 1
    current_square[1] += 2
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[1] -= 4
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[0] -= 1
    current_square[1] += 1
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[1] += 2
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[0] += 4
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[1] -= 2
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[0] -= 1
    current_square[1] -= 1
    add_edge(square.name, current_square) if find_square_by_name(current_square)
    current_square[1] += 4
    add_edge(square.name, current_square) if find_square_by_name(current_square)
  end

  def display_moves(square)
    moves = []
    calculate_children(square)
    square.children.each do |child|
      moves << child.name
    end
    puts "You are on space #{square.name}."
    puts "Your possible moves are: #{moves}."
  end

end

b = Board.new
s = b.find_square_by_name([4, 4])
b.display_moves(s)

