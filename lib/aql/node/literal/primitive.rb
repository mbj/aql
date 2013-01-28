module AQL
  class Node
    class Literal
      # Base class for primitive literals
      class Primitive < self
        include Composition.new(:value)
      end
    end
  end
end
