module AQL
  class Node
    class Literal
      # Base class for composed literals
      class Composed < self
        include Composition.new(:body)
      end
    end
  end
end
