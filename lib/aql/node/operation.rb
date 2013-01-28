module AQL
  class Node
    # Base class for operations
    class Operation < self

    private

      # Return keyword
      #
      # @return [Symbol]
      #
      # @api private
      #
      def keyword
        self.class::KEYWORD
      end

    end
  end
end
