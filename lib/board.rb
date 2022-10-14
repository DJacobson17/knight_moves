require_relative 'square'

class Board # rubocop:disable Style/Documentation
  attr_accessor :squares
  def initialize
    a = [1, 2, 3, 4, 5, 6, 7, 8]
    array = a.product(a)
    @squares =[]
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

  def add_edge(start_name, end_name, undirected = true)
    from = squares.index { |s| s.name == start_name }
    to   = squares.index { |s| s.name == end_name }
    squares[from].neighbors[to] = true
    squares[to].neighbors[from] = true if undirected
  end

  def build_board(array)
    array.each { |name| add_square(name) }
  end

  # def connect_neighbors(squares)
  #   squares.each do |s|
  #     s.neighbors << calculate_neighbors(s)
  #   end
  # end

  # def calculate_neighbors(square)

end

b = Board.new
p b
p b.find_square_by_name([3, 4]).name[1]

