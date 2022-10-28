# frozen_string_literal: true

class Square # rubocop:disable Style/Documentation
  attr_accessor :name, :adj, :pred, :dist

  def initialize(name = [])
    @name = name
    @adj = []
    @pred = nil
    @dist = nil
  end
end
