module AQL
  class Node
    # Base class for operators
    class Operator < self

    private

      # Return operator symbol
      #
      # @return [Symbol]
      #
      # @api private
      #
      def operator
        self.class::SYMBOL
      end

    end
  end
end
