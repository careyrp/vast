# frozen_string_literal: true

module VAST
  # Common base class for Elements of the VAST document.
  class Element
    attr_reader :source_node

    def initialize(node)
      @source_node = node
    end
  end
end
