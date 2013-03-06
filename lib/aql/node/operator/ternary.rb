module AQL
  class Node
    class Operator
      # Ternary operator
      class Ternary < self
        include Concord.new(:condition, :left, :right)

        SYMBOL = :'?'

      private

        # Emit node
        #
        # @param [Buffer] buffer
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          condition.visit(buffer)
          buffer.append(" #{operator} ")
          left.visit(buffer)
          buffer.append(' : ')
          right.visit(buffer)
        end
      end
    end
  end
end
