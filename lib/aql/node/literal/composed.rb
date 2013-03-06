module AQL
  class Node
    class Literal
      # Base class for composed literals
      class Composed < self
        include Concord.new(:body)
      end
    end
  end
end
