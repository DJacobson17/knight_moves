# frozen_string_literal: true

class Square # rubocop:disable Style/Documentation
  attr_accessor :name, :children

  def initialize(name = [])
    @name = name
    @children = []
    
  end
end
