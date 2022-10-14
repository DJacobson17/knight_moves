# frozen_string_literal: true

class Square # rubocop:disable Style/Documentation
  attr_accessor :name, :neighbors

  def initialize(name = [])
    @name = name
    @neighbors = []
  end
end
