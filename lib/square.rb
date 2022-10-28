# frozen_string_literal: true

class Square # rubocop:disable Style/Documentation
  attr_accessor :name, :adj

  def initialize(name = [])
    @name = name
    @adj = []
  end
end
